import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NotificationSceen extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationSceen> {
  Size _size;

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
            "有机化学",
            style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(children: [
                    Container(
                        decoration: BoxDecoration(
                            color: SQColor.lightGray),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              margin: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.deepOrangeAccent),
                              child: Text(
                                "张",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 0,
                            ),
                            Text(
                              "张国平",
                              style: TextStyle(
                                  color: Color(0xff666666), fontSize: 16),
                            ),
                            Spacer(),
                            Container(
                                child: Image.asset(
                                  "assets/icons/read.png",
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.topRight,

                                ),
                                transform: Matrix4.translationValues(0, -4, 0))
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 20, right: 20, bottom: 10),
                      child: Text(
                        "在App设计中状态栏纯色的这种设计很常见，但是如果状态栏需要为白色的时候就必须为黑色字体。在Android中已经有很多成熟的方案来处理这种情况，那我们现在看看在Flutter中这种情况该怎么处理。",
                        style:TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 10,top: 5,bottom: 10),
                      child: Row(
                        children: [ buildtag("通知", SQColor.orange) ],
                      ),
                    )
                  ]),
                );
              }),
        ));
  }
  Widget buildtag(String text,Color color){
    return Container(
      padding: EdgeInsets.fromLTRB(5, 2, 5, 3),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(99, color.red, color.green, color.blue), width: 0.5),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11, color: color),
      ),
    );

  }
}
