import 'dart:convert';
import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../constants.dart';

class BLEWIFI extends StatefulWidget {
  final BleManager bleManager;
final Peripheral peripheral;
  BLEWIFI(this.bleManager, this.peripheral,);
  @override
  _BLEWIFIState createState() => _BLEWIFIState();
}

class _BLEWIFIState extends State<BLEWIFI> {
  final TextEditingController pass = new TextEditingController();
  final TextEditingController ble_Name = new TextEditingController();


  bool connected=false;
 bool Wifi_on=false;
 String now_SSID="";
 String ssid="";
 int flag=-1;
 List<String> lists=[];
  connect()async{
    await widget.bleManager.stopPeripheralScan();
    var per=widget.peripheral;
    var isSus=false;
   var isconnected=await per.isConnected();
   if(isconnected==false){
     per.observeConnectionState(emitCurrentValue: true)
         .listen((connectionState) {
       print("Peripheral ${per.identifier} connection state is $connectionState");

       if(connectionState==PeripheralConnectionState.connected){
         setState(() {
           connected=true;
         });
       }
     });
    await per.connect();
     Future.delayed(Duration(milliseconds: 500),()async{
       var isconnected=await per.isConnected();
       if(isconnected==true){
         print("Peripheral ${per.identifier} connection state is $isconnected");

         setState(() {
           connected=true;
         });
         await per.discoverAllServicesAndCharacteristics();
         // List<Service> services = await peripheral.services(); //getting all services
         List<Characteristic> characteristics1 = await per.characteristics("4fafc201-1fb6-459e-8fcc-c5c9c331914b");
print(characteristics1.toString());
         var val=await    per.readCharacteristic("4fafc201-1fb6-459e-8fcc-c5c9c331914b", "beb5483e-36e2-4688-b7f5-ea07361b26a8");
         print("-------"+String.fromCharCodes(val.value));
         per.monitorCharacteristic("4fafc201-1fb6-459e-8fcc-c5c9c331914b", "beb5483e-36e2-4688-b7f5-ea07361b26a8").listen((event) {
           var status=String.fromCharCodes(event.value);
           print("-------"+status);
           if(status=="1"){
             setState(() {
               flag=1;
             });
             if(status=="0"){
               setState(() {
                 flag=0;
               });
             }
           }
         });

       }
     });

   }else{
     setState(() {
       connected=true;
     });
   }


  }

 inputWifi()async{

 }
 transferWifi()async{

 }
initWIFI()async{
    Wifi_on=await   WiFiForIoTPlugin.isEnabled();
    if(Wifi_on==false){
      BotToast.showText(text: "请开启WiFi");
      WiFiForIoTPlugin.setEnabled(true,shouldOpenSettings: true);
    }

 var  wlists=  await WiFiForIoTPlugin.loadWifiList();
for(var item in wlists) {
  if(item.frequency<3000)
    lists.add(item.ssid);
}
  now_SSID=await WiFiForIoTPlugin.getSSID();
  print(lists);
  setState(() {
  });



}
 @override
  void initState() {
    initWIFI();
    connect();

    // TODO: implement initState
    super.initState();

  }
  send()async{
    var passw=pass.text;
    var ble=ble_Name.text;
    if(ssid.isEmpty)ssid=now_SSID;
    if(passw.isEmpty||ble.isEmpty||ssid.isEmpty){
      BotToast.showSimpleNotification(title: "请输入信息");
      return;
    }
  await  widget.peripheral.writeCharacteristic("4fafc201-1fb6-459e-8fcc-c5c9c331914b", "beb5483e-36e1-4688-b7f5-ea07361b26a8", Uint8List.fromList("$ssid:$passw:$ble".codeUnits), false);
  }
  @override
  void dispose() {
    widget.peripheral.disconnectOrCancelConnection();
    widget.bleManager.destroyClient();
    // TODO: implement dispose
    super.dispose();
  }
  setssid(String x){
    setState(() {
      ssid=x;
    });
  }
  @override
  Widget build(BuildContext context) {
    // print(lists.map((e) => e.ssid));
    return  Scaffold(
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
    ),title:         Text("为开发板配置网络",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
    ,centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    ),
    body: SafeArea(child:
    flag==-1?
    connected&&Wifi_on?Column(children: [
      Image.asset("assets/images/olant.png",width: 200,height: 200,),
      Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 10),child: DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: lists,
          label: "WIFI SSID",
          hint: "SSID",showSearchBox:true,
          // popupBackgroundColor: MyColors.Colorgrey,
          onChanged: setssid,
          selectedItem: lists.contains(now_SSID)?now_SSID:null),),
      Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 10),child: TextFormField(
        controller: pass,

        decoration: InputDecoration(
          labelText: 'WiFi 密码',
          border: OutlineInputBorder(),

        ),
      ),),Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 10),child: TextFormField(
      controller: ble_Name,

      decoration: InputDecoration(
        labelText: 'BLE Name',
        border: OutlineInputBorder(),

      ),
    )),
      RoundedButton(
        text:"完成",
        press: send,
      )
    ],):Center(child:  SizedBox(height: 30,width: 30,child: Ring2InsideLoading(color: MyColors.Colorgrey,),)):Column(children: [
      Icon(flag==0?Icons.error:Icons.check_circle,size: 200,color:flag==0? MyColors.Colorred:MyColors.Colorgreen,),
      SizedBox(height: 20,),
      Text(flag==0?"WiFi配网出错":"WiFi配网成功",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
      ,
      RoundedButton(
        text:flag==0?"重试":"完成",
        press: (){

          if(flag==0)setState(() {
          flag=-1;
        });
          else{
            Navigator.pop(context);
          }
          },
      )
    ])));
  }
}
