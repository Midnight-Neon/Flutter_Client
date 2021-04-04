import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final bool expand;

  const ExpandableText({Key key, this.text, this.maxLines, this.style, this.expand}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExpandableTextState(text, maxLines, style, expand);
  }

}

class _ExpandableTextState extends State<ExpandableText> {
  final String text;
  final int maxLines;
  final TextStyle style;
  bool expand;

  _ExpandableTextState(this.text, this.maxLines, this.style, this.expand) {
    if (expand == null) {
      expand = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      final span = TextSpan(text: text ?? '', style: style);
      final tp = TextPainter(
          text: span, maxLines: maxLines, textDirection: TextDirection.ltr);
      tp.layout(maxWidth: size.maxWidth);

      if (tp.didExceedMaxLines) {
        return Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            expand ?
            Container(child:Text(text ?? '', style: style),padding: EdgeInsets.only(bottom: 15), width: double.maxFinite,):
      Container(child:Text(text ?? '', maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: style),width: double.maxFinite,),

            Positioned(child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  expand = !expand;
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white.withOpacity(0.2),Colors.white.withOpacity(0.7),Colors.white ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                height: 60,
                  padding: EdgeInsets.only(top: 30.0,bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [ Text(expand ? '收起' : '展开阅读', style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xf8175199))),Icon(expand ?Icons.keyboard_arrow_up_rounded:Icons.keyboard_arrow_down,size: 25,color:Color(0xf8175199) ,)]
                  )
              ),
            ),right: 0,left: 0,bottom: 0,)
          ],
        );
      } else {
        return Text(text ?? '', style: style);
      }
    });
  }
}
