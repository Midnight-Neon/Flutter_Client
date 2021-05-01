import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/http.dart';
import 'package:classmanage/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import 'BLE/bleSceen.dart';

class UserCenter extends StatefulWidget {
  @override
  _UserCenterState createState() => _UserCenterState();
}

class _UserCenterState extends State<UserCenter> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        padding: EdgeInsets.only(
          top: 50,
          left: 5,
          right: 5,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Container(
                width: _size.width * 0.96,
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xFF766af0), Color(0xFF958cf3)],
                )),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Image.asset("assets/images/decore-left.png"),
                      top: 0,
                      left: 0,
                      width: _size.height * 0.3,
                    ),
                    Positioned(
                      child: Image.asset("assets/images/decore-right.png"),
                      top: 0,
                      right: 0,
                      width: _size.height * 0.3,
                    ),
                    Positioned(
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_pin,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            Global.profile.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                letterSpacing: 3,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Global.profile.role!=Role.Teacher?
                          Tag(
                            text: "Lv.1",
                            color1: Colors.white,
                            image: SvgPicture.asset(
                              "assets/icons/model.svg",
                              width: 13,
                              height: 13,
                            ),
                          ):Tag(text: "教师",
                            color1: Colors.white,
                            image: SvgPicture.asset(
                              "assets/icons/doctor.svg",
                              width: 13,
                              height: 13,
                            ),),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [Tag(text: Global.profile.major!=null?Global.profile.major:"软件工程",icon: Icons.home_filled,color1: Color.fromRGBO(255,159,67,0.85),),
                            SizedBox(width: 10),Tag(text: Global.profile.department!=null?Global.profile.department:"计算机科学与技术",icon: Icons.flag,color1: Color.fromRGBO(40,199,111,0.85),)])
                        ],
                      ),
                      top: 40,
                    )
                  ],
                ),
              )),
          Card(
              color: SQColor.lightGray,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              elevation: 0,
              margin: EdgeInsets.all(10),
              child:GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    BotToast.showSimpleNotification(title: "测试版不允许修改信息,请联系管理员");

                  },
                  child: Container(
                    height: 60,
                    padding:
                    EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.grid_circle_fill,
                          size: 26,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "个人信息",
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ))),
          Card(
              color: SQColor.lightGray,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              elevation: 0,
              margin: EdgeInsets.all(10),
              child:GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Global.profile=null;
                    Global.getprefs().remove("profile");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

                  },
                  child: Container(
                    height: 60,
                    padding:
                    EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          size: 26,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "退出登录",
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ))),
          Card(
              color: SQColor.lightGray,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              elevation: 0,
              margin: EdgeInsets.all(10),
              child:GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    // BotToast.showSimpleNotification(title: "测试版不允许修改信息,请联系管理员");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BLEScreen()));

                  },
                  child: Container(
                    height: 60,
                    padding:
                    EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.dot_radiowaves_left_right,
                          size: 26,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "开发板配置",
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ))),
        ]));
  }
}
