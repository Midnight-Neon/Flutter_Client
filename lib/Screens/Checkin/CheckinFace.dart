import 'package:camera/camera.dart';
import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckinFace extends StatefulWidget {
  @override
  _CheckinFaceState createState() => _CheckinFaceState();
}

class _CheckinFaceState extends State<CheckinFace> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  int flag = 0;

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
        CameraController(cameraDescription, ResolutionPreset.high);

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

    super.dispose();
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
                clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      buildCamera(),
                      flag == 1
                          ? Positioned.fill(
                              child: Ring2InsideLoading(
                              color: SQColor.blue,
                            ))
                          : Container(),
                      Positioned(child: Container(height: 40,color: SQColor.darkGray.withOpacity(0.4),alignment: Alignment.center,child: Text(
                        "未检测到面孔",
                        style: TextStyle( fontSize: 15,color: SQColor.white),
                      ),),top: 0,left: 0,right: 0,)
                    ],
                    alignment: Alignment.center,
                  ),
                  decoration:  BoxDecoration(
                          border: flag == 2
                              ?Border.all(color: SQColor.blue, width: 3):null,
                          shape: BoxShape.circle)
                      )
            ]))));
  }

  Widget buildCamera() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Container();
    }
    print(cameraController.value.previewSize.width);
    print(cameraController.value.previewSize.height);

    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    return ClipOval(
      child: Container(
        color: Colors.blue,
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
    return true;
  }
}
