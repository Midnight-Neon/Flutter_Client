import 'dart:convert';
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/constants.dart';
import 'package:classmanage/model/CourseInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../http.dart';

class NotificationSceen extends StatefulWidget {
  final String id;
  const NotificationSceen({Key key, this.id}) : super(key: key);
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationSceen> {
  var now = new DateTime.now();
  Size _size;
  List<Notifications> infos=[];

@override
  void initState() {
    super.initState();
getInfo();
  }
  getInfo() async{
    var resp=await Global.dio.get("/course/${widget.id}");
    var info= CourseInfoResp.fromJson(json.decode(resp.data.toString()));
    print(info.toJson());
    if(info.code!=0){
      BotToast.showSimpleNotification(title: "网络错误");
      return;
    }
    var data=info.data;
    infos=[];
    data.notifications.forEach((element) {
      if(data.notificationsDone.contains(element.sId)){
        element.isRead=true;

      }
      infos.add(element);
    });
    print(infos);
    setState(() {
    });


  }
  setRead(String id,int i) async{
  if(infos[i].isRead) return;
    var resp=await Global.dio.get("/course/${widget.id}/notify/${id}");
    var info= CourseInfoResp.fromJson(json.decode(resp.data.toString()));
    if(info.code==0){
      infos[i].isRead=true;
    }
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          title: Text(
            "通知",
            style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: infos.length,

              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                var info=infos[index];
                return GestureDetector(onTap: ()=>{setRead(info.sId, index)},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                  child: Column(children: [
                    // Container(
                    //     decoration: BoxDecoration(
                    //         color: SQColor.lightGray),
                    //     child: Row(
                    //       children: [
                    //         //疑似头像
                    //         Container(
                    //           width: 32,
                    //           height: 32,
                    //           margin: EdgeInsets.all(8),
                    //           alignment: Alignment.center,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(8),
                    //               color: Colors.deepOrangeAccent),
                    //           child: Text(
                    //             "${info.owner[0]}",
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Colors.white,
                    //                 fontSize: 18),
                    //           ),
                    //          ),
                    //         SizedBox(
                    //           width: 0,
                    //         ),
                    //         Text(
                    //           info.owner,
                    //           style: TextStyle(
                    //               color: Color(0xff666666), fontSize: 16),
                    //         ),
                    //         Spacer(),
                    //         Container(
                    //             child: info.isRead?SvgPicture.asset(
                    //               "assets/icons/read.svg",
                    //               width: 40,
                    //               height: 40,
                    //               alignment: Alignment.topRight,
                    //               color: MyColors.ColordarkGray.withOpacity(0.4),
                    //               //已阅
                    //
                    //             ):null,
                    //             transform: Matrix4.translationValues(0, -4, 0))
                    //       ],
                    //     )),


                    // new Center(
                    //   child: SizedBox(width: 10,),
                    //     decoration: new BoxDecoration(
                    //   color: Colors.redAccent,
                    //   image: new DecorationImage(
                    //     image: new AssetImage('assets/images/b2.png'),
                    //     scale: 0.5,
                    //   ),
                    // )),
                    Stack(
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            info.isRead?Container(
                              child: Opacity(
                                opacity: 0.3,
                                child: new Image.asset("assets/images/isread.png",
                                    scale: 6),
                                ),
                              ):Container(),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          child: Text(
                            info.content,                        style:TextStyle(fontWeight: FontWeight.w500,fontSize: 17),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1.0,indent: 10.0,endIndent:10.0,color: Colors.black38,),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 10,top: 5,bottom: 5),
                      child: Row(
                        children: [
                        Row(
                          children: info.tag.map((e) =>  buildtag(e, SQColor.orange)).toList(),
                        ),
                        Spacer(),
                        Container(
                          width: 25,
                          height: 25,
                          margin: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.deepOrangeAccent),
                          child: Text(
                            "${info.owner[0]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14),
                          ),
                        ),

                        Text(
                          info.owner,
                          style: TextStyle(
                              color: Color(0xff666666), fontSize: 14),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        //Icon(Icons.circle,color: info.isRead?Colors.greenAccent:Colors.redAccent,size: 15.0,)
                      ],)
                    ),
                    // Container(
                    //   padding: EdgeInsets.fromLTRB(16, 0, 8, 8),
                    //   child:Row(
                    //     children: [
                    //       Text("${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}"+"  "+(info.isRead?"已读":"未读"),style: TextStyle(
                    //           color: Colors.black26,
                    //           fontSize: 10.0
                    //       ),),
                    //
                    //     ],
                    //   ),
                    // )
                    

                  ]),
                ));
              }),
        ));
  }
  Widget buildtag(String text,Color color){
    return Container(
      padding: EdgeInsets.fromLTRB(5, 2, 5, 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        border: Border.all(color: Color.fromARGB(99, color.red, color.green, color.blue), width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11, color: color),
      ),
    );

  }
}
