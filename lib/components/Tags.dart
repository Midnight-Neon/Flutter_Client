import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;
  final Color color1;
  final IconData icon;
  final Color color2;
  final Color textColor;

  final Widget image;

  const Tag({Key key, this.text, this.color1, this.icon, this.color2, this.image, this.textColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,      height: 23,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0)
      ),
    child: Row(
      children: [Container(color:color1,width: 25,height: double.infinity,padding:EdgeInsets.all(3),child: image==null?Icon(icon,color: Colors.white,size: 13,):image,
      ),Container(color: color2==null?Colors.grey.withOpacity(0.6):color2,height: double.infinity,padding: EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),alignment: Alignment.center,child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color:textColor==null? Colors.white:textColor,fontSize: 12),textAlign: TextAlign.center,),)],
    ),
    );
  }
}
