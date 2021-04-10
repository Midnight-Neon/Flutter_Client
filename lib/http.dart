import 'dart:convert';

import 'package:classmanage/model/profile.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          baseUrl:"http://192.168.124.5:5000",
        contentType: 'application/json; charset=utf-8'

      ));
      dio.interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            print('send request：path:${options.path}，baseURL:${options.baseUrl}');
            if(Global.profile!=null&&Global.profile.accessToken!=""){
              options.headers['Authorization']="Bearer "+Global.profile.accessToken;
            }
            return options;
          },
        onError: (DioError error) {
            print("Dio Error :${error}");
        }
      ));

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




