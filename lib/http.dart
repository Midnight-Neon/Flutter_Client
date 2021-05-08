import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:classmanage/main.dart';
import 'package:classmanage/model/profile.dart';
import 'package:classmanage/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  static Profile profile;
  static SharedPreferences getprefs()=>_prefs;
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();


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




