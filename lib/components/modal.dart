import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ModalFit extends StatefulWidget {
  const ModalFit({Key key, this.url, this.name}) : super(key: key);
  final String url;
  final String name;

  @override
  _ModalFitState createState() => _ModalFitState();
}

class _ModalFitState extends State<ModalFit> {
  bool isDownloading=false;
  bool isOpening=false;
  double progressValue=0.0;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('复制URL'),
                leading: Icon(Icons.content_copy),
                onTap: () => Clipboard.setData(ClipboardData(text: widget.url)).then((value) =>BotToast.showSimpleNotification(title: "复制成功")),
              ),
              ListTile(
                title: Text('打开'),
                leading:isOpening? SizedBox(width: 30,height: 30,child: CircularProgressIndicator(backgroundColor:MyColors.ColoroliveLight,value: progressValue,),):Icon(Icons.open_in_new),
                onTap: () => open(),
              ),
              ListTile(
                title: Text('下载'),
                leading: isDownloading? SizedBox(width: 25,height: 25,child:Center(child: CircularProgressIndicator(backgroundColor:MyColors.ColoroliveLight,value: progressValue,),)):Icon(Icons.cloud_download),
                onTap: () => download(),
              ),
              // ListTile(
              //   title: Text('Move'),
              //   leading: Icon(Icons.folder_open),
              //   onTap: () => Navigator.of(context).pop(),
              // ),
              // ListTile(
              //   title: Text('Delete'),
              //   leading: Icon(Icons.delete),
              //   onTap: () => Navigator.of(context).pop(),
              // )
            ],
          ),
        ));
  }

  open() async{
    var dicty=await _localPath;
  var exist= await File(dicty+"/"+widget.name).exists();
  if(!exist){
    setState(() {
      isOpening=true;
    });
    await Dio().download(widget.url,dicty+"/"+widget.name,onReceiveProgress: (all,downloaded)=>{this.setState(() {
      progressValue=downloaded/all;
    })});

    setState(() {
      isOpening=false;
      progressValue=0;
    });
  }
   OpenFile.open(dicty+"/"+widget.name);
  }
  download() async{
    var status = await Permission.storage.request().isGranted;
    if(status==false){
      BotToast.showSimpleNotification(title: "请授予权限");
      return;
    }
    var dirloc= (await getApplicationDocumentsDirectory()).path;
    if (Platform.isAndroid) {
      dirloc = "/sdcard/Download/";
    }
    var exist= await File(dirloc+"/"+widget.name).exists();
    if(!exist){
      setState(() {
        isDownloading=true;
      });
      await Dio().download(widget.url,dirloc+"/"+widget.name,onReceiveProgress: (all,downloaded)=>{this.setState(() {
        progressValue=downloaded/all;
      })});
      BotToast.showSimpleNotification(title: "已下载到系统下载文件夹");

      setState(() {
        isDownloading=false;
        progressValue=0;
      });
    }else{
      BotToast.showSimpleNotification(title: "文件已存在");

    }

  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
