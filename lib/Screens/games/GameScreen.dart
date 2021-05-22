import 'dart:math';

import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/constants.dart';
import 'package:classmanage/http.dart';
import 'package:classmanage/model/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:web_socket_channel/io.dart';

class GameScreen extends StatefulWidget {
  final String id;
  final int pos;
  final IOWebSocketChannel  channel  ;


  const GameScreen({Key key, this.id, this.pos,this.channel}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int quenum = 0;
  List<Word> wlist=[];
  String queword = "comprehensive";
  String quechinese = "综合的，广泛的";
  String yb = "/ˌkɑːmprɪˈhensɪv/";
  List<String> nullchar = [];
  List<int> nullcharpos = [];
  List<String> charList = [];
  int currentIndex=0;
  String alphabet = 'wertyuioasdfghlxcvbnm';
int flag=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }
  getList()async{
    var resp=await Global.dio.get("http://192.168.43.180:8000/word/${widget.id}");
   var wlists= WordResp.fromJson(resp.data);
   setState(() {
     wlist=wlists.data;
     quenum=0;
   });
    getnullqus();



  }
  // Widget buildGrid() {
  //   List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
  //   Widget content; //单独一个widget组件，用于返回需要生成的内容widget
  //   for (var item in charList) {
  //     if (item != '  ') {
  //       tiles.add(new Text(item,
  //           style: TextStyle(
  //             fontSize: 40.0,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black,
  //             // decoration: null,
  //           )));
  //     } else {
  //       tiles.add(new Text(item,
  //           style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 40.0,
  //               fontWeight: FontWeight.bold,
  //               decoration: TextDecoration.underline)));
  //     }
  //     tiles.add(SizedBox(
  //       width: 2.0,
  //     ));
  //   }
  //   content = new
  //   return content;
  // }

  void getnullqus() {
    var item=wlist[quenum];
    setState(() {
      currentIndex=0;
      queword=item.word;
      quechinese=item.meaning;
      yb=item.pron;
      nullcharpos=[];
      nullchar=[];
    });
    int len = queword.length;
    // print(queword[0]);

    List<String> list1 = <String>[];
    for (int i = 0; i < len; i++) {
      var value = queword.substring(i, i + 1);
      // print(value);
      list1.add(value);
    }

    final _random = new Random();

    if (len > 2) {
      int nullc = len ~/ 2; //2
      int sh = len ~/ nullc; //2
      int hs = 0;
      if(nullc>8) nullc=8;
      for (int i = 0; i < nullc; i++) {
        int s1 = _random.nextInt(sh) + hs;
        //1 ,3
        print(list1[s1]);
        nullcharpos.add(s1); // 1 ,3
        nullchar.add(list1[s1]); // e y
        list1[s1] = '  ';
        hs += sh; //2
      }
      for (var i = nullc; i < 8; i++) {
        var x = alphabet[_random.nextInt(alphabet.length)];
        while (nullchar.contains(x)) {
          x = alphabet[_random.nextInt(alphabet.length)];
        }
        nullchar.add(x);
      }
      nullchar.shuffle(_random);
    }
    setState(() {
      charList = list1;
    });
  }

  Widget get_ans() {
    return Column(
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _calcButton(nullchar[0]),
            _calcButton(nullchar[1]),
            _calcButton(nullchar[2]),
          ],
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _calcButton(nullchar[3]),
            _calcButton(nullchar[4]),
            _calcButton(nullchar[5]),
          ],
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _calcButton(nullchar[6]),
            _calcButton(nullchar[7]),
            _calcButton(''),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        child: Container(
      padding: EdgeInsets.all(40),
      color: Color(0xFFF8F8F8),
      child: wlist.length>0?Column(
        children: [
          Text(
            "剩余题目：" + (9-quenum).toString(),
            style: TextStyle(fontSize: 20, color: Colors.black38),
          ),
          Container(
            padding: EdgeInsets.only(top: 100, bottom: 10),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (var x in charList)
                    Padding(
                        padding: EdgeInsets.only(left: 0.5, right: 0.5),
                        child: Text(x.length>1&&x!='  '?x[1]:x,
                            style: TextStyle(
                                letterSpacing: 1,
                                color: x.length>1&&x!='  '?Colors.blueAccent:Colors.black,
                                fontSize: 38.0,
                                fontWeight: FontWeight.bold,
                                decoration: x=='  '
                                    ? TextDecoration.underline
                                    : null)))
                ]),
                SizedBox(
                  height: 10,
                ),

                //  Row(
                //      mainAxisAlignment: MainAxisAlignment.center,
                //  children: [
                Text(quechinese,
                    style: TextStyle(fontSize: 15, color: Colors.black38)),
                //],
                //  ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tag(
                      color1: Colors.grey,
                      icon: Icons.record_voice_over,
                      text: yb,
                    )
                  ],
                ),
              ],
            ),
          ),
          
          Expanded(child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Spacer(),
              if(flag==1)
              Lottie.asset("assets/images/14584-well-done.json",repeat: false,width: 250,height: 200)
              else if(flag==-1)
                Lottie.asset("assets/images/62484-error-mark.json",repeat: false,width: 250,height: 200)

            ],
          )),
          Container(
            alignment: Alignment.center,
            child: get_ans(),
            padding: EdgeInsets.only(bottom: 30),
          )
        ],
      ):Center(child: SizedBox(height: 40,width: 40,child: Ring2InsideLoading(color: MyColors.Colorgray,),),),
    ));
    throw UnimplementedError();
  }

  Widget _calcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        customBorder: Border.all(color: MyColors.Colorgray),
        onTap: () {
          if(value==''){
            if(currentIndex==0) return;
            currentIndex--;
            charList[nullcharpos[currentIndex]]='  ';
            setState(() {

            });
            return;
          }
          if(currentIndex>nullcharpos.length-1){
            return;
          }
          charList[nullcharpos[currentIndex]]="."+value;
          currentIndex++;
          if(currentIndex==nullcharpos.length){
            var res=charList.join().replaceAll(".", "");
            print(res);
            if(res==wlist[quenum].word){
              quenum++;
              flag=1;
              setState(() {

              });
              Future.delayed(Duration(seconds: 2,),(){
              setState(() {
                flag=0;

              });
              });
              if(quenum==wlist.length){
                Navigator.pop(context);
                return;
              }
              getnullqus();
            }
          }

          // nullcharpos.removeAt(0);
          setState(() {

          });
        },
        child: Container(
          alignment: Alignment.center,
          width: 90,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: MyColors.ColorgreyLight,
                  offset: Offset(0, 3),
                  blurRadius: 2.0,
                  spreadRadius: 2.0),
            ],
            color: MyColors.Colorwhite,
          ),
          child: value==''?Icon(Icons.backspace):Text(
            value,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: MyColors.Colorblack),
          ),
        ));
  }
}
