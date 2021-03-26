import 'package:flutter/material.dart';
import 'package:classmanage/Screens/Login/components/background.dart';
import 'package:classmanage/Screens/Signup/signup_screen.dart';
import 'package:classmanage/components/already_have_an_account_acheck.dart';
import 'package:classmanage/components/rounded_button.dart';
import 'package:classmanage/components/rounded_input_field.dart';
import 'package:classmanage/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/rounded_button.dart';
import '../../Signup/components/or_divider.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "学号",
              onChanged: (value) {},
            ),
            RoundedPasswordField(

              onChanged: (value) {},
            ),
            RoundedButton(
              text: "登陆",
              press: () {},
            ),
            SizedBox(height: size.height * 0.01),
            OrDivider(),
            RoundedButton(color: Colors.black,press: () {},radius: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/upc.svg",
                    height: 25,
                    width: 25,
                  ),SizedBox(width: 15,),
                  Text(
                    "通过 ",style: TextStyle(color: Colors.white,fontSize: 17),
                  ),
                  Text("数字石大",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),),Text(" 登录",style: TextStyle(color: Colors.white,fontSize: 17),)
                ],
              ),
            )
            // AlreadyHaveAnAccountCheck(
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
