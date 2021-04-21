import 'package:cached_network_image/cached_network_image.dart';
import 'package:classmanage/Screens/Index.dart';
import 'package:classmanage/components/Tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseItem extends StatelessWidget {
  final String Name;
  final String id;
  final String Teacher;
  final String ClassName;

  const CourseItem({Key key, this.Name, this.id, this.Teacher, this.ClassName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(

        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: GestureDetector(onTap: ()=>{
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ClassIndex(id: id,name: Name,className: ClassName,teacher: Teacher,)))
        },child:Container(
          height: 130,
          padding: EdgeInsets.only(left: 30, right: 10, top: 10, bottom: 10),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 22,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 35,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        Name,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white.withOpacity(0.95),
                            fontSize: 22),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 80,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(3.0)),
                        transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                      ),
                    ],
                  )),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Tag(text: Teacher,icon: CupertinoIcons.person_alt,color1: Colors.grey,),
            SizedBox(width: 10,)
            ,Tag(text: ClassName,icon: CupertinoIcons.text_bubble_fill
                    ,color1: Colors.grey,)

                ],
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.5),
              image: DecorationImage(
                  colorFilter:
                      new ColorFilter.mode(Colors.black12, BlendMode.srcOver),
                  image: CachedNetworkImageProvider(
                    "https://image.weilanwl.com/color2.0/plugin/sylb2244.jpg",
                  ),
                  fit: BoxFit.cover)),
        )));
  }
}
