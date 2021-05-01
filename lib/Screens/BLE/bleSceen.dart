import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/Screens/BLE/BLEDevices.dart';
import 'package:classmanage/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants.dart';

class BLEScreen extends StatefulWidget {
  @override
  _BLEScreenState createState() => _BLEScreenState();
}

class _BLEScreenState extends State<BLEScreen> {

  startService()async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.bluetooth,
    ].request();
    for(var i in statuses.values){
      if(i.isDenied) {
      var result=await showDialog<bool>(
          context: context,
          builder: (context) {
            return  AlertDialog(
          title: Text("提示"),
          content: Text("部分权限不满足,再次授权?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
            FlatButton(
              child: Text("授权"),
              onPressed: () {
                // ... 执行删除操作
                Navigator.of(context).pop(true); //关闭对话框
              },
            ),
          ],
        );});
      if(result){
        Map<Permission, PermissionStatus> statuses = await [
          Permission.location,
          Permission.bluetooth,
        ].request();
        for(var i in statuses.values){
          if(i.isDenied) {Navigator.pop(context);}
      }

      }else{
        Navigator.pop(context);
      }
    }

  }
    Navigator.push(context, MaterialPageRoute(builder: (context)=>BLEDevices()));  }

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
    ),title:         Text("为开发板配置网络",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          ,centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    ),
    body: SafeArea(
      child: SizedBox.expand(child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
        Image.asset("assets/images/rocket.png",width: 100,height: 250,),
        SizedBox(height: 60,),RoundedButton(text:"开始配网",press: ()=>{startService()},),
        SizedBox(height: 20,),
        Text.rich( TextSpan(text:"在配网之前,请确保:\n\t本机蓝牙已打开.\n\t可以扫描到",style: TextStyle(fontSize: 15,),children: [TextSpan(text: "BLE Init",style: TextStyle(fontWeight: FontWeight.bold)),TextSpan(text: "设备.")])),

      ],),)

    ));
  }
}
