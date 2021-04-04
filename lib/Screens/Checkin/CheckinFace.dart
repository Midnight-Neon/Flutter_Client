import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CheckinFace extends StatefulWidget {
  @override
  _CheckinFaceState createState() => _CheckinFaceState();
}

class _CheckinFaceState extends State<CheckinFace> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;

  @override
  void initState() {
    super.initState();
   initCameras();
  }
  initCameras() async{
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
    return Center(
      child:ClipOval(
      child: buildCamera(),
        clipper: _MyClipper(),
    ));
  }
  Widget buildCamera(){
    if ( cameraController== null || !cameraController.value.isInitialized) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

  return  Transform.scale(
        scale: cameraController.value.aspectRatio / deviceRatio,
        // alignment: Alignment.topLeft,
        child: Center(
          child: AspectRatio(
            aspectRatio: cameraController.value.aspectRatio,
            child: CameraPreview(cameraController),
          ),
        ));
  }
}
class _MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0, 0, 200, 200);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }



}
