import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final IconData iconfill;
final GestureTapCallback ontap;
final bool flag ;
  const NavigatorItem({Key key, this.text, this.icon, this.iconfill, this.ontap, this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: ontap,
        child: Container(
      padding: EdgeInsets.only(left: 50,right: 50,top: 5,bottom: 5),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(flag?iconfill:icon,
              color: Colors.black),

          Text(text)
        ],)
      ));

  }
}
