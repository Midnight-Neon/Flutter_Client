import 'package:classmanage/constants.dart';
import 'package:flutter/material.dart';
class SMClipper extends CustomClipper<Rect>{
  final double rating;
  SMClipper({
    this.rating
  }): assert(rating != null);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, rating , size.height);
  }

  @override
  bool shouldReclip(SMClipper oldClipper) {
    return rating != oldClipper.rating;
  }
}
class RatingBar extends StatefulWidget {
  final int count;
  final double maxRating;
  final double value;
  final double size;
  final double padding;

  final bool selectAble;
  RatingBar({
    this.maxRating = 10.0,
    this.count = 5,
    this.value = 10.0,
    this.size = 30,
    this.padding,
    this.selectAble = false,
  });
  _RatingBarState  createState() => _RatingBarState();

}
class _RatingBarState extends State<RatingBar> {

  int fullStars() {
    if(widget.value != null) {
      return (widget.value /(widget.maxRating/widget.count)).floor();
    }
    return 0;
  }

  double star() {
    if(widget.value != null) {
      if(widget.count / fullStars() == widget.maxRating / widget.value ) {
        return 0;
      }
      return (widget.value % (widget.maxRating/widget.count))/(widget.maxRating/widget.count);
    }
    return 0;
  }

  List<Widget> buildRow() {
    int full = fullStars();
    List<Widget> children = [];
    for(int i = 0; i < full; i ++) {
      children.add(Icon(Icons.star_rate_rounded,size: widget.size,color: Colors.orangeAccent,));
      if(i < widget.count - 1) {
        children.add(SizedBox(width: widget.padding,),);
      }
    }
    if(full < widget.count) {
      children.add(Icon(Icons.star_half_rounded,size: widget.size,color: Colors.orangeAccent,));
    }
    for(int i=full+1;i<widget.count;i++){
      children.add(Icon(Icons.star_border_rounded,size: widget.size,color: Colors.orangeAccent,),);
    }
    return children;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buildRow(),
    );
  }
}