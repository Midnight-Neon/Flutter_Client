import 'package:classmanage/Screens/Notifications/Notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassIndex extends StatefulWidget {
  @override
  _ClassIndexState createState() => _ClassIndexState();
}

class _ClassIndexState extends State<ClassIndex> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "有机化学",
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
                          "有机化学",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            buildInfo("汤家凤 / 李永乐", Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            buildInfo("全校班", CupertinoIcons.text_bubble_fill)
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [],
                ),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.89),
                  children: [
                    buildEntry(),
                    buildEntry(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.all(18),
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: [
                        buildIcon("签到", svg: "time"),
                        buildIcon("信息", svg: "message"),
                        buildIcon("班级成员",
                            icon: Icon(
                              Icons.people,
                              color: Color(0xf87367f0),
                              size: 40,
                            )),
                        buildIcon("作业", svg: "document"),
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

  Widget buildEntry() {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,

        onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context){return NotificationSceen();}))
            },
        child: Container(
          width: _size.width * .8,
          height: 40,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color(0x8854C852),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0.1), // changes position of shadow
            ),
          ], color: Color(0x8854C852), borderRadius: BorderRadius.circular(10)),
          child: Container(
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
                            text: '2',
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                            text: '条',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.normal),
                          )
                        ]))),
                Positioned(
                    bottom: 12,
                    left: 16,
                    child: RichText(
                        text: TextSpan(
                            text: '待完成',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                            text: '作业',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.normal),
                          )
                        ]))),
                Positioned(
                  child: Image.asset(
                    "assets/icons/Edit.png",
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
          ),
        ));
  }
}
