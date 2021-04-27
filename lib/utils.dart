import 'package:classmanage/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/Login/casLogin.dart';

void schemeJump(BuildContext context, String schemeUrl) {
  final _jumpUri = Uri.parse(schemeUrl.replaceFirst(
    'classmanage://',
    'http://path/',
  ));
  if(Global.profile!=null&&Global.profile.accessToken!=null)
  return
  print(_jumpUri);
  switch (_jumpUri.path) {
    case '/cas':
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CASLogin(token: _jumpUri.queryParameters['token'],)));
      break;
    default:
      break;
  }
}
class Routerkey {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}