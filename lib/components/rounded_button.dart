import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:classmanage/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double radius;
  final Widget child;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.radius=26,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
          color: color,
          onPressed: press,
          child: child==null?Text(
            text,
            style: TextStyle(color: textColor,fontSize: 17.0,fontWeight: FontWeight.bold),
          ):child,
        ),
      ),
    );
  }
}
