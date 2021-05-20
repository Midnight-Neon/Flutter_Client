import 'dart:convert';
import 'dart:math';

import 'package:classmanage/components/Tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scidart/numdart.dart';

class GameScreen extends StatefulWidget{
  final String id;
  const GameScreen ({Key key, this.id}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();

}
class _GameScreenState extends State<GameScreen>
{
  int quenum=9;
  String queword="comprehensive";
  String quechinese= "综合的，广泛的";
  String yb = "/ˌkɑːmprɪˈhensɪv/";
  var nullchar = [];
  var nullcharpos = [];
  Widget buildGrid(List list1) {
    List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for(var item in list1) {
      if(item!='  ')
        {
          tiles.add(
              new Text(item,style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                  color: Colors.black,
               // decoration: null,
              ))
          );
        }
      else
        {
          tiles.add(new Text(item,style: TextStyle(
            color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline
          )));
        }
      tiles.add(SizedBox(width: 2.0,));
    }
    content = new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
      //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );
    return content;
  }
  Row getnullqus()
  {
    int len = queword.length;
    Row row = new Row();
    List<String> list1 = <String>[];
    for (int i=0;i<len;i++) {
      var value = queword.substring(i,i+1);
      print(value);
      list1.add(value);
    };

    final _random = new Random();

    if(len>2)
      {
        int nullc = len~/2;//2
        int sh = len~/nullc;//2
        int hs=0;
        for(int i =0;i<nullc;i++)
          {
            int s1= _random.nextInt(sh)+hs;//1 ,3
            nullcharpos.add(s1);// 1 ,3
            nullchar.add(list1[s1]);// e y
            list1[s1] = '  ';
            hs+=sh;//2
          }
        return buildGrid(list1);
      }
  }
  Widget get_ans(){

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Material(child: Container(
      padding: EdgeInsets.all(40),
      color: Colors.white,
      child: Column(
        children: [
          Text("剩余题目："+quenum.toString(),style: TextStyle(fontSize: 20,color: Colors.black38),),
        Container(
          padding: EdgeInsets.only(top: 100,bottom: 100),
          alignment: Alignment.topCenter,
          child:Column(
            children: [
              getnullqus(),
            //  Row(
          //      mainAxisAlignment: MainAxisAlignment.center,
              //  children: [
              Text(quechinese,style: TextStyle(fontSize: 15,color: Colors.black38)),
            //],
            //  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ Tag(
                  text: yb,
                )],
              )
            ],
          ),
        ),
          Container(
            alignment: Alignment.center,
            child: get_ans(),
          )

        ],
      ),
    ));
    throw UnimplementedError();

  }

}

