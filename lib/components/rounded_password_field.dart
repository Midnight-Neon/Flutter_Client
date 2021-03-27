import 'package:flutter/material.dart';
import 'package:classmanage/components/text_field_container.dart';
import 'package:classmanage/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
   RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);



  @override
  State<StatefulWidget> createState() => _RoundedPasswordState();
}
class _RoundedPasswordState extends State<RoundedPasswordField>{
  bool obscureText=true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscureText,
        onChanged: this.widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "密码",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon:GestureDetector(child: Icon(

            Icons.visibility,
            color: kPrimaryColor,
          ),onTap: ()=>{
           this.setState(() {
             obscureText=!obscureText;
           })
          },),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
