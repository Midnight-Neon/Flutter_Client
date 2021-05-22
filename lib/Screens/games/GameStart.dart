import 'dart:convert';

import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/components/rounded_button.dart';
import 'package:classmanage/http.dart';
import 'package:classmanage/model/WSMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_socket_channel/io.dart';

import '../../constants.dart';
import 'GameScreen.dart';
import 'GaneResult.dart';

class GameStart extends StatefulWidget {
  const GameStart({Key key}) : super(key: key);

  @override
  _GameStartState createState() => _GameStartState();
}

class _GameStartState extends State<GameStart> {
  IOWebSocketChannel _channel;

  int pos = 0;
  String CId = "";
  bool isReady = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initWebsocket();
  }

  initWebsocket() async {
    var resp = await Global.dio.get("http://192.168.124.5:8000/words");
    var res = resp.data;
    // if(res['code']==0){
    CId = res['data'];
    pos = res['pos'];
    _channel =
        IOWebSocketChannel.connect("ws://192.168.124.5:8000/ws/$CId/${pos}");

    _channel.stream.listen((event) {
      print(event);
      var message = WSMessage.fromJson(json.decode(event.toString()));
      if (message.type == 9) {
        setState(() {
          isReady = true;
        });
        print(isReady);
      }
    });
    setState(() {});

    // }
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
          title: Text(
            "开启单词对战",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: SafeArea(
            child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/Games_Head.svg",
                width: 300,
                height: 300,
              ),
              SizedBox(
                height: 60,
              ),
              isReady
                  ? RoundedButton(
                      text: "开始游戏",
                      press: () => {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => GameScreen(
                        //               id: CId,
                        //               pos: pos,
                        //               channel: _channel,
                        //             ))).then((value) => Navigator.pop(context))
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>GameResult(flag: 1,)))

              },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Ring2InsideLoading(
                            color: MyColors.Colorgray,
                          ),
                        )
                      ],
                    ),
              isReady
                  ? RoundedButton(
                text: "开始游戏",
                press: () => {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => GameScreen(
                  //               id: CId,
                  //               pos: pos,
                  //               channel: _channel,
                  //             ))).then((value) => Navigator.pop(context))
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>GameResult(flag: 0,)))

                },
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Ring2InsideLoading(
                      color: MyColors.Colorgray,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Text.rich( TextSpan(text:"在配网之前,请确保:\n\t本机蓝牙已打开.\n\t可以扫描到",style: TextStyle(fontSize: 15,),children: [TextSpan(text: "BLE Init",style: TextStyle(fontWeight: FontWeight.bold)),TextSpan(text: "设备.")])),
            ],
          ),
        )));
  }
}
