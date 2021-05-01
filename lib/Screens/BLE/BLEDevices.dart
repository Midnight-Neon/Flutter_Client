import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/Screens/BLE/BLEWIFI.dart';
import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';

import '../../constants.dart';
import 'bleSceen.dart';

class BLEDevices extends StatefulWidget {
  @override
  _BLEDevicesState createState() => _BLEDevicesState();
}

class _BLEDevicesState extends State<BLEDevices> {
  List<ScanResult> res=[];
  BleManager bleManager;
  List<String> idis=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBLE();
  }
  initBLE()async{
    bleManager = BleManager();
    await bleManager.createClient();
    BluetoothState currentState = await bleManager.bluetoothState();
    if(currentState==BluetoothState.POWERED_OFF){
    await  bleManager.enableRadio();
    }
    if(currentState==BluetoothState.UNAUTHORIZED||currentState==BluetoothState.UNSUPPORTED||currentState==BluetoothState.UNKNOWN){
      BotToast.showSimpleNotification(title: "蓝牙开启错误");// bleManager.enableRadio();
      return;
    }
    bleManager.observeBluetoothState().listen((btState) {
      print(btState);
      if(btState==BluetoothState.POWERED_ON){
        scan();
      }
    });


  }

  void scan() {
    bleManager.stopPeripheralScan();
  res=[];
    bleManager.startPeripheralScan(uuids: [
      "4fafc201-1fb6-459e-8fcc-c5c9c331914b"        ],allowDuplicates: false
    ).listen((event) {
      print(event);
      // print(String.fromCharCodes(event.advertisementData.manufacturerData.sublist(2),));
      if(!idis.contains(event.peripheral.identifier)){
       res. add(event);
       idis.add(event.peripheral.identifier);
       setState(() {
       });
      }
    });
    Future.delayed(Duration(seconds: 30),(){
      bleManager.stopPeripheralScan();
    });

  }
  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
    ),title:         Text("选择开发板",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
    ,centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    ),
    body: SafeArea(
      child:res.length!=0? ListView.builder(shrinkWrap:true,itemBuilder: (context,i){
        var item=res[i];
        print(item);
       return Card(
            color: SQColor.lightGray,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            elevation: 0,
            margin: EdgeInsets.all(10),
            child:GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  // BotToast.showSimpleNotification(title: "测试版不允许修改信息,请联系管理员");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BLEWIFI(bleManager, item.peripheral))).then((value) => Navigator.pop(context));

                },
                child: Container(
                  height: 60,
                  padding:
                  EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.developer_board_outlined,
                        size: 26,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(
                          item.peripheral.name,
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                        ),Text.rich(TextSpan(text:item.peripheral.identifier,style: TextStyle(color: MyColors.Colorgrey),children: [TextSpan(text: "  ‧  ",style: TextStyle(fontWeight: FontWeight.bold)),TextSpan(text:"-${item.rssi}db")]))],

                      ),
                      Spacer(),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                )));
      },itemCount: res.length,):Center(child: SizedBox(height: 30,width: 30,child: Ring2InsideLoading(color: MyColors.Colorgrey,),),),
    ));
  }
}
