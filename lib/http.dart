import 'dart:convert';
import 'package:classmanage/Screens/Homework.dart';
import 'package:classmanage/Screens/Homework/HomeworkLists.dart';
import 'package:classmanage/Screens/Notifications/Notification.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:classmanage/main.dart';
import 'package:classmanage/model/profile.dart';
import 'package:classmanage/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:classmanage/model/push.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_appcenter_bundle/flutter_appcenter_bundle.dart';

String decodeBase64(String toDecode) {
  String res;
  try {
    while (toDecode.length * 6 % 8 != 0) {
      toDecode += "=";
    }
    res = utf8.decode(base64.decode(toDecode));
  } catch (error) {
    throw Exception("decodeBase64([toDecode=$toDecode]) \n\t\terror: $error");
  }
  return res;
}
const BASE_URL="https://alsworld.xyz/api";
class Global {
  static SharedPreferences _prefs;
  static Dio dio;
  static JPush jpush;
  static Profile profile;
  static SharedPreferences getprefs()=>_prefs;
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    jpush=JPush();
    jpush.setup(
      appKey: "c6602febf6b1966918a53af9",
      channel: "theChannel",
      production: false,
      debug: true, // 设置是否打印 debug 日志
    );
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
        var estr=message['extras']['cn.jpush.android.EXTRA'];
        var extra=pushModel.fromJson(json.decode(estr));
        switch (extra.type) {
          case 0:
            {
             await Routerkey.navigatorKey.currentState.push(MaterialPageRoute(
                  builder: (context) => HomeworkList(id: extra.cid,)));
            }break;
          case 1:
            {
              await Routerkey.navigatorKey.currentState.push(MaterialPageRoute(
                  builder: (context) => NotificationSceen(id: extra.cid,)));
            }break;
          case 2:
            {
              await Routerkey.navigatorKey.currentState.push(MaterialPageRoute(
                  builder: (context) => HomeworkScreen(cid: extra.cid,id: extra.id,)));
            }break;
        }



      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );
    if(profile!=null&&profile.accessToken!=null){
      jpush.getRegistrationID().then((value) =>
         dio.post("/push",data: {"pushID":value}));
      jpush.setTags([Global.profile.iD,Global.profile.group,Global.profile.name,"Role${Global.profile.role}"]).then((value) => print("JPUSH Tags:$value"));

    }



    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
         profile=Profile.fromJson(json.decode(_profile));



      } catch (e) {
        print(e);
      }}
      dio=new Dio(BaseOptions(
          baseUrl:BASE_URL,
        contentType: 'application/json; charset=utf-8'

      ));
      dio.interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            print('send request：path:${options.path}，baseURL:${options.baseUrl}');
            // print(options.headers);
            if(Global.profile!=null&&Global.profile.accessToken!=""&&!options.headers.containsKey("Authorization")&&!options.path.contains("login")){
              Map<String, dynamic> jwt= json.decode(decodeBase64(
                  Global.profile.accessToken.split(".")[1])
              );
              var now=new DateTime.now();
              // print(jwt['exp']*1000);
              if(jwt['exp']*1000<=now.millisecondsSinceEpoch){
                print("Out Token");
                dio.lock();

               var resp=await Dio().get("/refresh",options: RequestOptions(headers: {"Authorization":"Bearer "+Global.profile.refreshToken},baseUrl: BASE_URL));
               if(resp.statusCode==401){
                 Routerkey.navigatorKey.currentState.pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyHomePage()), (route) => route == null);
dio.clear();
               }else{
                 if(resp.statusCode==200){
                   if(resp.data['access_token']!=null){
                     Global.profile.accessToken=resp.data['access_token'];
                     _prefs.setString("profile", json.encode(Global.profile));
                   }
                 }

               }
                dio.unlock();



              }
              options.headers['Authorization']="Bearer "+Global.profile.accessToken;

            }
            return options;
          },
        onError: (DioError error) async{
            print("Dio Error :${error}");

        }
      ));

    await AppCenter.startAsync(
      appSecretAndroid: '8ab9259a-ec78-477d-b868-30a1e79d55ea',
      appSecretIOS: '8ab9259a-ec78-477d-b868-30a1e79d55ea',
      enableAnalytics: true, // Defaults to true
      enableCrashes: true, // Defaults to true
      enableDistribute: false, // Defaults to false
      usePrivateDistributeTrack: false, // Defaults to false
      disableAutomaticCheckForUpdate: false, // Defaults to false
    );


    print(await AppCenter.getInstallIdAsync());
    await initializeDateFormatting();


  }

}
// class CustomInterceptors extends Interceptor {
//   @override
//   void onRequest(RequestOptions options) async{
//     print('REQUEST[${options.method}] => PATH: ${options.path}');
//
//     return options;
//
//   }
//
// }




