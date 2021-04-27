import 'dart:convert';

import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/components/rounded_button.dart';
import 'package:classmanage/http.dart';
import 'package:classmanage/model/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../main.dart';

class CASLogin extends StatefulWidget {
  String token;
  @override
  _CASLoginState createState() => _CASLoginState();
CASLogin({
  Key key,
    this.token
}):super(key: key);
}

class _CASLoginState extends State<CASLogin> {
  int flag=0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initInfo();
  }
  initInfo() async{
  try{
 var resp=await Global.dio.get("/casLogin?token=${widget.token}");
    print(resp);
  if(resp.data['code']!=0){
    setState(() {
      flag=-1;
    });
  }else{
    var res= LoginResp.fromJson(resp.data);
    Global.profile=res.data;

    Global.getprefs().setString("profile", json.encode(res.data));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
  }
  }catch(e){
    print(e);
    setState(() {
      flag=-1;
    });
    }

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
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    ),
    body: SafeArea(
      child: SizedBox.expand(child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 60,),
          SvgPicture.asset("./assets/icons/upc.svg",width: 150,height: 150,color: MyColors.Colorblack,),
        SizedBox(height: 60,),
        if(flag==0)
        SizedBox(height: 50,width: 50,child: Ring2InsideLoading(color: MyColors.Colorgrey,),)
        else if(flag<0)

      ...[SizedBox(height: 50,
        width: 50,
        child: Icon(Icons.error,size: 50,color: MyColors.Colorred,),

      ),
        SizedBox(height: 20,),

        Text("CAS 登陆失败",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        Text("请检查账号是否添加到系统",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

        SizedBox(height: 60,),

        RoundedButton(
          text: "返回",
          press: () {
            Navigator.pop(context);
          },
        ),
      ]

        ],

      ),
    )));
  }
}
