import 'package:flutter/cupertino.dart';

class CASLogin extends StatefulWidget {
  String token;
  @override
  _CASLoginState createState() => _CASLoginState();
CASLogin({
  Key key,
    this.token
}):super(key: key);
}

class _CASLoginState extends State<CASLogin> {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(this.widget.token));
  }
}
