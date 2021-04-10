import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/http.dart';
import 'package:classmanage/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:classmanage/Screens/Login/components/background.dart';
import 'package:classmanage/components/rounded_button.dart';
import 'package:classmanage/components/rounded_input_field.dart';
import 'package:classmanage/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import '../../../components/rounded_button.dart';
import '../../../main.dart';
import '../../Signup/components/or_divider.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SigninState();
  }



}

class _SigninState extends State<Body>{
  final String _url="https://cas.upc.edu.cn/cas/login?service=https://saltedfish.fun/cas.php";
  String id="";
  String pass="";
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
  void login() async{
if(id==""||pass==""){
  BotToast.showSimpleNotification(title: "请输入用户名密码");
  return;
}
BotToast.showLoading();
try{
  var resp= await Global.dio.post("/login",data: {'ID':id,'PassWd':generateMd5(pass)});

LoginResp res=LoginResp.fromJson(json.decode(resp.data.toString()));
print(res);
if(res.code!=0){
  BotToast.showSimpleNotification(title: "登录失败");
}else{
  Global.profile=res.data;
  Global.getprefs().setString("profile", json.encode(res.data));
  BotToast.closeAllLoading();
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
}} catch (e, stack) { 
  BotToast.closeAllLoading();
  BotToast.showSimpleNotification(title: "登录失败");


}


}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "学号",
              onChanged: (value) {
                setState(() {
                  id=value;
                });
              },
            ),
            RoundedPasswordField(

              onChanged: (value) {
                setState(() {
                  pass=value;
                });
              },            ),
            RoundedButton(
              text: "登陆",
              press: () {
                login();
              },
            ),
            SizedBox(height: size.height * 0.01),
            OrDivider(),
            RoundedButton(color: Colors.black,press: _launchURL,radius: 10,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/upc.svg",
                    height: 25,
                    width: 25,
                  ),SizedBox(width: 15,),
                  Text(
                    "通过 ",style: TextStyle(color: Colors.white,fontSize: 17),
                  ),
                  Text("数字石大",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),),Text(" 登录",style: TextStyle(color: Colors.white,fontSize: 17),)
                ],
              ),
            )
            // AlreadyHaveAnAccountCheck(
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

}
