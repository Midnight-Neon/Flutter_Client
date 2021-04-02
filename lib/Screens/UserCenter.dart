import 'package:classmanage/components/Tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                            "李翔",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                letterSpacing: 3,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Tag(
                            text: "Lv.1",
                            color1: Colors.white,
                            image: SvgPicture.asset(
                              "assets/icons/model.svg",
                              width: 13,
                              height: 13,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [Tag(text: "软件工程",icon: Icons.home_filled,color1: Color.fromRGBO(255,159,67,0.85),),
                            SizedBox(width: 10),Tag(text: "计算机科学与技术",icon: Icons.flag,color1: Color.fromRGBO(40,199,111,0.85),)])
                        ],
                      ),
                      top: 40,
                    )
                  ],
                ),
              ))
        ]));
  }
}
