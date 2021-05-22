import 'dart:ui';

import 'package:classmanage/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';

class GameResult extends StatelessWidget {
  final int flag;
  const GameResult({Key key, this.flag}) : super(key: key);

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
          ),title:         Text("游戏结束",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          ,centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: SafeArea(
          child: SizedBox.expand(child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
            flag==0?  Image.asset("assets/images/loser.webp",width: 200,height: 350,):
            // Lottie.asset("assets/images/winner.json",width: 200,height: 350,),
              Image.asset("assets/images/winner.webp",width: 200,height: 350,),
             Text(flag==0?"A Stone's Throw":"You Win",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

              SizedBox(height: 60,),RoundedButton(text:"退出",press: ()=>{Navigator.pop(context)},),
              SizedBox(height: 20,),
              // Text.rich( TextSpan(text:"在配网之前,请确保:\n\t本机蓝牙已打开.\n\t可以扫描到",style: TextStyle(fontSize: 15,),children: [TextSpan(text: "BLE Init",style: TextStyle(fontWeight: FontWeight.bold)),TextSpan(text: "设备.")])),

            ],),)

        ));
  }
}
