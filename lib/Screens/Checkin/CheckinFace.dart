import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:classmanage/Screens/Checkin/proccess_results.dart';
import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/constants.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:scidart/numdart.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'anchors.dart';
import 'detection.dart';
import 'filter_anchors.dart' as filter;
import 'options_face.dart';

class CheckinFace extends StatefulWidget {
  @override
  _CheckinFaceState createState() => _CheckinFaceState();
}

class _CheckinFaceState extends State<CheckinFace> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  int flag = 0;
  String _text="未检测到面孔";
  img.Image _image;
  bool _isDetecting=false;
  bool  _isUpload=false;
  OptionsFace options = OptionsFace(
      numClasses: 1,
      numBoxes: 896,
      numCoords: 16,
      keypointCoordOffset: 4,
      ignoreClasses: [],
      scoreClippingThresh: 100.0,
      minScoreThresh: 0.75,
      numKeypoints: 6,
      numValuesPerKeypoint: 2,
      reverseOutputOrder: false,
      boxCoordOffset: 0,
      xScale: 128,
      yScale: 128,
      hScale: 128,
      wScale: 128);

  AnchorOption anchors = AnchorOption(
      inputSizeHeight: 128,
      inputSizeWidth: 128,
      minScale: 0.1484375,
      maxScale: 0.75,
      anchorOffsetX: 0.5,
      anchorOffsetY: 0.5,
      numLayers: 4,
      featureMapHeight: [],
      featureMapWidth: [],
      strides: [8, 16, 16, 16],
      aspectRatios: [1.0],
      reduceBoxesInLowestLayer: false,
      interpolatedScaleAspectRatio: 1.0,
      fixedAnchorSize: true);
  NormalizeOp _normalizeInput = NormalizeOp(127.5, 127.5);
  List<Anchor> _anchors = new List();
  ImageProcessor _imageProcessor;
  Interpreter _interpreter;
  @override
  void initState() {
    super.initState();
    initCameras();
  }

  initCameras() async {
    availableCameras().then((value) {
      cameras = value;
      if (cameras.length > 1) {
        setState(() {
          selectedCameraIndex = 1;
        });
        initCamera(cameras[selectedCameraIndex]).then((value) {});
      } else {
        print('No camera available');
      }
    }).catchError((e) {
      print('Error : ${e.code}');
    });
  }

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high,enableAudio: false);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController.value.hasError) {
      print('Camera Error ${cameraController.value.errorDescription}');
    }

    try {
      await cameraController.initialize();

      flag = 1;
      _loadModel();
    } catch (e) {
      String errorText = 'Error ${e.code} \nError message: ${e.description}';
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cameraController?.dispose();
    // _interpreter?.close();

    super.dispose();
  }
// Load model
  void _loadModel() async {
    _anchors = filter.getAnchors(anchors);
    _interpreter =
    await Interpreter.fromAsset("models/face_detection_front.tflite");
   var _inputShape = _interpreter.getInputTensor(0).shape;
    _imageProcessor = ImageProcessorBuilder()
        .add(ResizeOp(
        _inputShape[1], _inputShape[2], ResizeMethod.NEAREST_NEIGHBOUR))
        .add(_normalizeInput)
        .build();
    setState(() {
    });
    await _onStream();
  }

// Initialize camera ande get frames
  _onStream() async {
    await cameraController.startImageStream((CameraImage image) async {
      if (_isDetecting) return;
      _isDetecting = true;
      Future.delayed(const Duration(seconds: 1), () {
        _tfLite(image);
        _isDetecting = false;
      });
    });

  }

// Process image from camera
  _tfLite(CameraImage image) async {
    img.Image _img;
    if (!_isUpload) {
      if (Platform.isIOS)
        //TODO Not Supported
        return;

        _img = await convertYUV420toImageColor(image);

      TensorImage tensorImage = TensorImage.fromImage(_img);
      _image=tensorImage.image;


      setState(() {
      });
      tensorImage = _imageProcessor.process(tensorImage);
     // print( _image.height);
     //  print( _image.width);

      TensorBuffer output0 = TensorBuffer.createFixedSize(
          _interpreter.getOutputTensor(0).shape,
          _interpreter.getOutputTensor(0).type);
      TensorBuffer output1 = TensorBuffer.createFixedSize(
          _interpreter.getOutputTensor(1).shape,
          _interpreter.getOutputTensor(1).type);

      Map<int, ByteBuffer> outputs = {0: output0.buffer, 1: output1.buffer};

      _interpreter.runForMultipleInputs([tensorImage.buffer], outputs);


      List<double> regression = output0.getDoubleList();
      List<double> classificators = output1.getDoubleList();
// print(regression);
//       print(classificators);
//       print(classificators.length);

      List<Detection> detections = process(
          options: options,
          rawScores: classificators,
          rawBoxes: regression,
          anchors: _anchors);

      List<Detection> _detections = origNms(detections, 0.75);
      print(_detections.length);
      if(_detections.length>0){
        setState(() {
          _isUpload=true;
          _text="正在比对";
        });
        Future.delayed(const Duration(seconds: 10), () {
          setState(() {
            // _isUpload=false;
            // _text="未检测到面孔";
            flag=2;
          });
        });


      }


    }
  }
  List<Detection> process(
      {OptionsFace options,
        List<double> rawScores,
        List<double> rawBoxes,
        List<Anchor> anchors}) {
    List<double> detectionScores = new List();
    List<int> detectionClasses = new List();

    int boxes = options.numBoxes;
    for (int i = 0; i < boxes; i++) {
      int classId = -1;
      double maxScore = double.minPositive;
      for (int scoreIdx = 0; scoreIdx < options.numClasses; scoreIdx++) {
        double score = rawScores[i * options.numClasses + scoreIdx];
        if (options.sigmoidScore) {
          if (options.scoreClippingThresh > 0) {
            if (score < -options.scoreClippingThresh)
              score = -options.scoreClippingThresh;
            if (score > options.scoreClippingThresh)
              score = options.scoreClippingThresh;
            score = 1.0 / (1.0 + exp(-score));
            if (maxScore < score) {
              maxScore = score;
              classId = scoreIdx;
            }
          }
        }
      }
      detectionClasses.add(classId);
      detectionScores.add(maxScore);
    }
    // print(detectionScores);
    List<Detection> detections = convertToDetections(
        rawBoxes, anchors, detectionScores, detectionClasses, options);
    // print(detections);
    return detections;
  }
  List<Detection> convertToDetections(
      List<double> rawBoxes,
      List<Anchor> anchors,
      List<double> detectionScores,
      List<int> detectionClasses,
      OptionsFace options) {
    List<Detection> _outputDetections = new List();
    for (int i = 0; i < options.numBoxes; i++) {
      if (detectionScores[i] < options.minScoreThresh) continue;
      int boxOffset = 0;
      Array boxData = decodeBox(rawBoxes, i, anchors, options);
      Detection detection = convertToDetection(
          boxData[boxOffset + 0],
          boxData[boxOffset + 1],
          boxData[boxOffset + 2],
          boxData[boxOffset + 3],
          detectionScores[i],
          detectionClasses[i],
          options.flipVertically);
      _outputDetections.add(detection);
    }
    return _outputDetections;
  }
  Future<img.Image> convertYUV420toImageColor(CameraImage image) async {
    final int width = image.planes[0].bytesPerRow;
    final int height = image.height;
    final int uvRowStride = image.planes[1].bytesPerRow;
    final int uvPixelStride = image.planes[1].bytesPerPixel;
    var buffer = img.Image(width, height);
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        final int uvIndex =
            uvPixelStride * (x / 2).floor() + uvRowStride * (y / 2).floor();
        final int index = y * width + x;
        if (uvIndex > image.planes[1].bytes.length) {
          continue;
        }
        final yp = image.planes[0].bytes[index];
        final up = image.planes[1].bytes[uvIndex];
        final vp = image.planes[2].bytes[uvIndex];
        int r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
        int g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
            .round()
            .clamp(0, 255);
        int b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);
        buffer.data[index] = (0xFF << 24) | (b << 16) | (g << 8) | r;
      }
    }
    return img.copyRotate(
        img.copyCrop(buffer, 0, 0, image.width, image.height), -90);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: MyColors.primaryColorLight.withAlpha(20),
                ),
                child: const Center(
                  child: const Icon(
                    CupertinoIcons.back,
                    color: MyColors.primaryColor,
                    size: 20,
                  ),
                )),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
        ),
        body: SafeArea(
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "完成人脸校验",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "拿起手机,保证面部完全展示",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      buildCamera(),
                      flag==1 ?  Positioned.fill(
                              child: Ring2InsideLoading(
                              color: !_isUpload?Color(0xFF3688FF):SQColor.golden,
                            )):Positioned.fill(
                        child: Container(color: SQColor.lightGray.withOpacity(0.7),child: Icon(Icons.check,size: 50,color: SQColor.primary,),),
                      )
                          ,
                      flag==1 ? Positioned(child: Container(height: 40,color: SQColor.darkGray.withOpacity(0.4),alignment: Alignment.center,child: Text(
                        _text,
                        style: TextStyle( fontSize: 15,color: SQColor.white),
                      ),),top: 0,left: 0,right: 0,):Container()
                    ],
                    alignment: Alignment.center,
                  ),
                  decoration:  BoxDecoration(
                          border: flag == 2
                              ?Border.all(color: SQColor.blue, width: 3):null,
                          shape: BoxShape.circle)
                      ),
                      // _image!=null?Container(child:Image.memory(img.encodePng(_image),height: 200,fit: BoxFit.contain,),):Container()
            ]))));
  }

  Widget buildCamera() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Container();
    }
    // print(cameraController.value.previewSize.width);
    // print(cameraController.value.previewSize.height);

    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    return ClipOval(
      child: Container(
        width: 200,
        height: 200,
        child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
            child: Container(
              width: cameraController.value.previewSize.height,
              height: cameraController.value.previewSize.width,
              child: AspectRatio(
                  aspectRatio: 1 / cameraController.value.aspectRatio,
                  child: CameraPreview(cameraController)),
            )),
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    print(size);
    return new Rect.fromLTWH(0, 0, 400, 400);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
