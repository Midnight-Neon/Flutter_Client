import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/http.dart';
import 'package:classmanage/model/CourseList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants.dart';
import 'CourseItem.dart';

class CourseBuilder extends StatefulWidget {
  @override
  _CourseBuilderState createState() => _CourseBuilderState();
}

class _CourseBuilderState extends State<CourseBuilder> {
  List<CourseItem> courses=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateCourses();

  }
  Future<void> updateCourses() async{
     var resp=await Global.dio.get("/courses");
     // print();
    var res=CourseListResp.fromJson(json.decode(resp.data.toString()));
    if(res.code==-1){
      BotToast.showSimpleNotification(title: "获取数据出错");
      return;
    }courses=[];
    res.data.forEach((element) {
      courses.add(CourseItem(Name:element.title,Teacher:element.teacher.map((e) => e.name).join(" \\ "),ClassName: element.group,id: element.sId,));
    });
    setState(() {
    });


  }
  @override
  Widget build(BuildContext context) {
    var child=[
      SizedBox(
        height: 40,
      ),
      Container(
        margin: EdgeInsets.only(left: 20),
        child: Text(
          "欢迎 ${Global.profile.name}${Global.profile.role<0?"老师":"同学"}",
          textAlign: TextAlign.left,

          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
      ),SizedBox(
        height: 10,
      ),
      Container(
        margin: EdgeInsets.only(left: 20,bottom: 30),
        child: Text(
          "这里是您的课程列表",
          textAlign: TextAlign.left,
          style: TextStyle( fontSize: 20,color: Colors.black26),
        ),
      ),

    ];
    if(courses.length>0){
      child.addAll(courses);
    }
    return RefreshIndicator(
      onRefresh: (){ return updateCourses();}, //下拉刷新回调
      color: Colors.black,
      //backgroundColor: Colors.blue,
      displacement: 40, //指示器显示时距顶部位置
      child: ListView.builder(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
        padding: EdgeInsets.only(
          top: 40,
          left: 10,
          right: 10,
        ),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: child
        // )
        itemCount: child.length,
        itemBuilder: (context,i){
          return child[i];
        },

      ));
  }
}
