import 'package:classmanage/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'CourseItem.dart';

class CourseBuilder extends StatefulWidget {
  @override
  _CourseBuilderState createState() => _CourseBuilderState();
}

class _CourseBuilderState extends State<CourseBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateCourses();

  }
  void updateCourses() async{
     var resp=await Global.dio.get("/courses");
     print(resp.data.toString());
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
        padding: EdgeInsets.only(
          top: 40,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "欢迎 李翔同学",
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
            CourseItem()
          ],
        ));
  }
}
