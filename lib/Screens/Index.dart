import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/Screens/Asks/Asks.dart';
import 'package:classmanage/Screens/Homework.dart';
import 'package:classmanage/Screens/Homework/HomeworkLists.dart';
import 'package:classmanage/Screens/Notifications/Notification.dart';
import 'package:classmanage/Screens/Records/Records.dart';
import 'package:classmanage/Screens/StuLists/StuLists.dart';
import 'package:classmanage/Screens/netdisk/netdisk.dart';
import 'package:classmanage/constants.dart';
import 'package:classmanage/http.dart';
import 'package:classmanage/model/CourseInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appcenter_bundle/flutter_appcenter_bundle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassIndex extends StatefulWidget {
  final String id;
  final String name;
  final String teacher;
  final String className;



  const ClassIndex({Key key, this.id, this.name, this.teacher, this.className}) : super(key: key);
  @override
  _ClassIndexState createState() => _ClassIndexState();
}

class _ClassIndexState extends State<ClassIndex> {
  Size _size;
  List<Widget> entry=[];

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
   if(Global.profile.role>=0){
     entry=[];
     if(data.homeworkUndone>0){
       entry.add(buildEntry(data.homeworkUndone.toString(),"条","待完成","作业",MyColors.Colorcyan,"form_fill"));
     }
     var notifynum=0;
     data.notifications.forEach((element) {
       if(!data.notificationsDone.contains(element.sId)){
         notifynum++;
       }
     });
     if(notifynum!=0)   entry.add(buildEntry(notifynum.toString(),"条","待确认","通知",MyColors.Colormauve,"comment_fill"));
     AppCenter.trackEventAsync('my event', <String, String> {
       'prop1': 'prop1',
       'prop2': 'prop2',
     });
   }
   setState(() {

   });



  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.name,
            style: TextStyle(letterSpacing: 3,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [Color(0xff9890e3), Color(0xffb1f4cf)],
            //   ),
            // ),
          ),
        ),
        body: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            buildInfo(widget.teacher, Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            buildInfo(widget.className, CupertinoIcons.text_bubble_fill)
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),

                entry.length>0?GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.7),
                  children: entry,
                ):Container(),
                SizedBox(
                  height: 5,
                ),
                Container(
                    margin: EdgeInsets.all(18),
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: [
                      if( Global.profile.role!=Role.Teacher) GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context){return CheckinRecord(id: widget.id,);}))
                            },
                            child:
                            buildIcon("签到", icon: Image.asset("assets/icons/checkin.png",width: 40,height: 40,)),
                        ),
                        if( Global.profile.role!=Role.Teacher) GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context){return NotificationSceen(id: widget.id,);}))
                      },
                      child:buildIcon("通知", svg: "message")),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context){return StudentLists(id: widget.id,);}))
                      },
                      child: buildIcon("班级成员",
                          icon: Icon(
                            Icons.people,
                            color: Color(0xf87367f0),
                            size: 40,
                          ))) ,
                        if( Global.profile.role!=Role.Teacher)   GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context){return HomeworkList(id: widget.id,);}))
                      },
                      child:
                        buildIcon("作业", svg: "form_fill")),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context){return AskList(id: widget.id,);}))
                      },
                      child:buildIcon("问答", svg: "command_fill")),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context){return Netdisk(id: widget.id);}))
                      },
                      child:buildIcon("资源", svg: "discover_fill"))
                      ],
                    ))
              ],
            )));
  }

  Widget buildInfo(String text, IconData iconData) {
    return Container(
      child: Row(
        children: [
          Icon(
            iconData,
            size: 16,
            color: Colors.black45,
          ),
          Text(
            " | ",
            style: TextStyle(fontSize: 13),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black45,
            ),
          )
        ],
      ),
    );
  }

  Widget buildIcon(String text, {Widget icon, String svg}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == null
              ? SvgPicture.asset(
                  "assets/icons/$svg.svg",
                  height: 40,
                  width: 40,
                )
              : icon,
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildEntry(String text1,String text2,String text3,String text4,Color bgColor,String svgPath) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context){return HomeworkList(id: widget.id,);}))
            },
        child: Container(
          width: _size.width * .8,
          height: 40,
          margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: SQColor.lightGray,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ], color: bgColor, borderRadius: BorderRadius.circular(10)),
          child: Stack(
            overflow: Overflow.visible,
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,

            children: [
             Container(
               decoration: BoxDecoration(
                 color: bgColor.withOpacity(0.2),
                   borderRadius: BorderRadius.circular(10)),
               width: _size.width * 0.4,transform: Matrix4.translationValues(0.0, 10.0, 0.0),
               height: 40,

             ) ,Positioned.fill(child: Container(
                height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("assets/images/bg.png"),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 12,
                    left: 16,
                    child: RichText(
                        text: TextSpan(
                            text: text1,
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                            text: text2,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.normal),
                          )
                        ]))),
                Positioned(
                    bottom: 12,
                    left: 16,
                    child: RichText(
                        text: TextSpan(
                            text: text3,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                            text: text4,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.normal),
                          )
                        ]))),
                Positioned(
                  child: SvgPicture.asset(
                    "assets/icons/$svgPath.svg",
                    color: MyColors.Colorwhite,
                    width: 40,
                    height: 40,
                  ),
                  right: 10,
                  top: 10,
                )
                // ,SizedBox(height: 10,),Text("签到",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                ,
                Positioned(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  bottom: 10,
                  right: 40,
                )
              ],
            ),
          )),
    ])));
  }
}
