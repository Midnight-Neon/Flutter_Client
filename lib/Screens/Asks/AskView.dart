import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:classmanage/Screens/Homework.dart';
import 'package:classmanage/Screens/Photo_view.dart';
import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/model/AskViewResp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../http.dart';
import 'AskNew.dart';
import 'ExpandableText.dart';

class AskView extends StatefulWidget {
  final String id;
  final String cid;

  const AskView({Key key, this.id, this.cid}) : super(key: key);
  @override
  _AskViewState createState() => _AskViewState();
}

class OneAsk {
  int index;
  IconData head;
  String askper;
  String askthing;
  bool isTeacher;
  OneAsk(this.index, this.head, this.askper, this.askthing, this.isTeacher);
}

class _AskViewState extends State<AskView> {

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;
  List<OneAsk> asklist = [];
  String quetitle = "哥哥，早上起床之前都要抱紧我哦！晚上睡觉之前做更多色色的事吧！";
  String Author="";
  Data askinfo;
  String ques = "";
  List<String> assets = ["https://images.unsplash.com/photo-1519865885898-a54a6f2c7eea?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=695&q=80"];
  updateList() async{
    var resp=await Global.dio.get("/course/${widget.cid}/ask/${widget.id}");
    var info= AskReply.fromJson(json.decode(resp.data.toString()));
    if(info.code!=0){
      BotToast.showSimpleNotification(title: "网络错误");
      return;
    }
    var askinfo=info.data;
    print(askinfo);


    setState(() {
      this.askinfo=askinfo;
      assets=askinfo.pics;
    });

  }
  @override
  void initState() {
    super.initState();
    updateList();
    print(" 初始化");
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      //print("监听开始");
      // print(_controller.offset); //打印滚动位置
      if (_controller.offset < 60 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 60 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }
  Widget quelisttile(Reply oneAsk) {
    return Column(
      children: [
        new Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 5.0, top: 5.0),
                    child: Row(children: [
                      Icon(CupertinoIcons.number_circle_fill,size: 13, ),
                      SizedBox(width: 2.0),
                      Text(oneAsk.owner,
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.black38)),
                      Spacer(),
                      oneAsk.role==Role.Teacher
                          ? buildtag("教师", SQColor.golden,
                              CupertinoIcons.checkmark_seal_fill)
                          : Transform.scale(
                              scale: 0.8,
                              child: Tag(
                                text: "Lv.1",
                                color1: SQColor.golden,
                                image: SvgPicture.asset(
                                  "assets/icons/model.svg",
                                  width: 13,
                                  height: 13,
                                ),
                              )),
                    ])),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: ExpandableText(
                      text: oneAsk.content,
                      maxLines: 3,
                      style: TextStyle(fontSize: 13.0)),
                )
              ],
            )),
        SizedBox(height: 2.5)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          showToTopBtn ? askinfo.title : "",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: askinfo!=null? ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: ListView(
            controller: _controller,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(askinfo.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            height: 1.2,
                            // decorationStyle: TextDecorationStyle.dashed
                          )),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Row(
                            children: [
                              Spacer(),
                              Transform.scale(
                                  scale: 0.8,
                                  child: Global.profile.role!=Role.Teacher?
                                  Tag(
                                    text: "Lv.1",
                                    color1: Colors.white,
                                    image: SvgPicture.asset(
                                      "assets/icons/model.svg",
                                      width: 13,
                                      height: 13,
                                    ),
                                  ):Tag(text: "教师",
                                    color1: MyColors.ColorgreyLight,
                                    image: SvgPicture.asset(
                                      "assets/icons/doctor.svg",
                                      width: 13,
                                      height: 13,
                                    ),)),
                              Text(askinfo.owner,
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black38
                                  )),
                            ]
                        ),
                      ),
                      SizedBox(height: 5),
                      ExpandableText(
                          text: askinfo.content,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 13.0,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      assets.length == 0
                          ? Container()
                          : Container(child:ListView.builder(scrollDirection: Axis.horizontal,padding: const EdgeInsets.all(10.0),shrinkWrap: true,itemCount: assets.length,itemBuilder: (context, i) {
                              var item = assets[i];
                              return GestureDetector(
                                onTap: () {
                                  return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PhotoPreview(
                                                imageProvider:
                                                    CachedNetworkImageProvider(
                                                        item),
                                              )));
                                },child:ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child:  CachedNetworkImage(imageUrl: item,height: 80,),

                              ),);
                            }),height: 100,)
                    ],
                  )),
              SizedBox(height: 5.0),
              Container(
                child: Column(
                  children: [
                    Container(
                        color: Colors.white,
                        padding:
                            EdgeInsets.only(top: 6.0, left: 5.0, bottom: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("回答",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  fontSize: 14.0,
                                )),
                            SizedBox(width: 2.0),
                            Text(asklist.length.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    height: 1.2))
                          ],
                        )),
                    SizedBox(height: 0.5),
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: askinfo.reply.length,
                        itemBuilder: (context, index) {
                          return quelisttile(askinfo.reply[index]);
                        })
                  ],
                ),
              )
            ],
          )):Center(child: SizedBox(height: 30,width: 30,child: Ring2InsideLoading(color: MyColors.Colorolive,),),),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.endFloat, 0, -30),
      floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.ellipses_bubble_fill),
          backgroundColor: Colors.black,
        onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AskNew(id: widget.cid,aid: widget.id,title: askinfo.title,);
        })).then((value) => updateList())},
         ),
    );
  }

 static  Widget buildtag(String text, Color color, IconData icon) {
    return Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
        decoration: BoxDecoration(
          color: Color.fromARGB(99, color.red, color.green, color.blue),
          border: Border.all(
              color: Color.fromARGB(99, color.red, color.green, color.blue),
              width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(children: [
          Icon(
            icon,
            color: color,
            size: 10,
          ),
          SizedBox(
            width: 1,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 10, color: color, fontWeight: FontWeight.bold),
          ),
        ]));
  }


}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX; // X方向的偏移量
  double offsetY; // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}
