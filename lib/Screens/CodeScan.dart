import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/Screens/Checkin/CheckinFace.dart';
import 'package:classmanage/Screens/Checkin/CheckinNum.dart';
import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/constants.dart';
import 'package:classmanage/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CodeScanner extends StatefulWidget {
  @override
  _CodeScannerState createState() => _CodeScannerState();
}

class _CodeScannerState extends State<CodeScanner> {
  Barcode result;
  QRViewController controller;
  BleManager bleManager;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }
  @override
  void dispose()async {
    // TODO: implement dispose
   // await controller?.stopCamera();
   controller?.dispose();
   bleManager.destroyClient();
   super.dispose();
  }
  initBle()async{
    bleManager = BleManager();
    await bleManager.createClient();
    BluetoothState currentState = await bleManager.bluetoothState();
    if(currentState==BluetoothState.POWERED_OFF){
      await  bleManager.enableRadio();
    }
  }
@override
  void initState() {
    // TODO: implement initState
  initBle();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildQrView(context),
    );
  }




  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Stack(fit: StackFit.expand, alignment: Alignment.center, children: [
      Positioned(
        child: QRView(
          key: qrKey,
          formatsAllowed: [BarcodeFormat.qrcode],
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
              borderColor: SQColor.primary,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: scanArea),
        ),
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
      ),
      result == null
          ? Container()
          : Center(
              child: Container(
                  width: 40,
                  height: 40,
                  child: Ring2InsideLoading(
                    color: Colors.greenAccent,
                    duration: Duration(milliseconds: 1200),
                    curve: Curves.bounceInOut,
                  )),
            ),
      Positioned(
        child: Text(
          "请对准签到二维码进行扫描",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: SQColor.white),
        ),
        top: 120,
      )
    ]);
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async{
      if(scanData.code.startsWith("{")){
      this.controller.pauseCamera();
      setState(() {
        result = scanData;
      });
      try{
        var obj=json.decode(result.code);
        var code=obj['code'];
        var mac=obj['mac'];
        var blename=obj['Ble'];
        var bleCode=mac;
        if(code==null||mac==null){
          setState(() {
            result = null;
          });
          this.controller.resumeCamera();

          return;

        }

          if(mac!="null"){
            bleManager.startPeripheralScan(uuids: [
              "4fafc201-1fb5-459e-8fcc-c5c9c331914b"        ],allowDuplicates: false
            ).listen((event) async{
              print(event);
              print(blename);
              print(mac);

              if(event.peripheral.name==blename&&event.peripheral.identifier.toLowerCase()==mac){
                bleCode=mac+"-"+String.fromCharCodes(event.advertisementData.manufacturerData.sublist(2),);
                print("----"+bleCode);
                bleManager.stopPeripheralScan();
                this.controller.resumeCamera();

                switch (obj['type']){
                  case 1:
                    var res= await Global.dio.post("/checkin",data: {"code":code,"uid":Global.profile.iD,"type":1,"name":Global.profile.name,"ble":bleCode});
                    var data=  json.decode( res.data.toString());

                    if(data['code']==0){
                      BotToast.showSimpleNotification(title: "签到成功");
                    }
                    Navigator.pop(context);
                    break;
                  case 2:
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => CheckinCode(code: obj['code'],ble: bleCode,)));
                    return;
                  case 3:
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => CheckinFace(code: obj['code'],ble: bleCode,)));
                    return;
                    break;
              }
              print(event);

            }});
            Future.delayed(Duration(seconds: 30),(){
              bleManager.stopPeripheralScan();
            });
        }else{
        this.controller.resumeCamera();
        // this.controller.dispose();



        switch (obj['type']){
          case 1:

           var res= await Global.dio.post("/checkin",data: {"code":code,"uid":Global.profile.iD,"type":1,"name":Global.profile.name,"ble":bleCode});
         var data=  json.decode( res.data.toString());

         if(data['code']==0){
           BotToast.showSimpleNotification(title: "签到成功");
         }
           Navigator.pop(context);
          break;
          case 2:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => CheckinCode(code: obj['code'],ble: bleCode,)));
            return;
          case 3:
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => CheckinFace(code: obj['code'],ble: bleCode,)));
            return;
            break;
          default:
            this.controller.resumeCamera();
            // print(e);
            setState(() {
              result = null;
            });

        }

      }}catch(e){
        this.controller.resumeCamera();
print(e);
        setState(() {
          result = null;
        });
      }

      }
      // Future.delayed(Duration(seconds: 2), () {
      //
      //   print('延时1s执行');
      // });
    });
  }
}
