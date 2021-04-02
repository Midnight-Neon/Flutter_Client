import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AskList extends StatefulWidget {
  @override
  _AskListState createState() => _AskListState();
}

class _AskListState extends State<AskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('讨论区'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {  },child: Icon(CupertinoIcons.add),backgroundColor: Colors.black,),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Card(
                margin: EdgeInsets.fromLTRB(3,10,5,2),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(children: [
                    Text(
                      "如何评价「Alicesoft」在11月27日发售的新作《ドーナドーナ》（多娜多娜 一起来干坏事吧）?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 5,),
                    // Row(children: [],),
                    SizedBox(height: 5,),
                    Text("""日文版刚出时写的评测，直接搬过来。
游戏名：ドーナドーナ いっしょにわるいことをしよう
发行日期：2020-11-27

开发：ALICESOFT

原画：魚介 等

剧本：ダイスころがし

声优：小波すず、金松由花、飴川紫乃、鈴谷まや、東シヅ、榛名れん、百千るか、夏樹柑菜 等

批评空间中央值：85（2020.12.7时）

""".replaceAll(RegExp("\n"), ""),maxLines: 3,overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Tag(text: "李翔",icon: Icons.person,color1: Colors.deepPurpleAccent.withOpacity(0.8),textColor: Colors.grey.shade700,),Spacer(),buildtag("老师问", SQColor.orange,CupertinoIcons.heart_circle_fill),buildtag("老师答", SQColor.golden,CupertinoIcons.checkmark_seal_fill),
                        ],
                    )
                  ]),


                )),
            Card(
                margin: EdgeInsets.fromLTRB(3,10,5,2),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(children: [
                    Text(
                      "如何评价「Alicesoft」在11月27日发售的新作《ドーナドーナ》（多娜多娜 一起来干坏事吧）?",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 5,),
                    // Row(children: [],),
                    SizedBox(height: 5,),
                    Text("""日文版刚出时写的评测，直接搬过来。
游戏名：ドーナドーナ いっしょにわるいことをしよう
发行日期：2020-11-27

开发：ALICESOFT

原画：魚介 等

剧本：ダイスころがし

声优：小波すず、金松由花、飴川紫乃、鈴谷まや、東シヅ、榛名れん、百千るか、夏樹柑菜 等

批评空间中央值：85（2020.12.7时）

""".replaceAll(RegExp("\n"), ""),maxLines: 3,overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Tag(text: "李翔",icon: Icons.person,color1: Colors.deepPurpleAccent.withOpacity(0.8),textColor: Colors.grey.shade700,),Spacer(),buildtag("老师问", SQColor.orange,CupertinoIcons.heart_circle_fill),buildtag("老师答", SQColor.golden,CupertinoIcons.checkmark_seal_fill),
                      ],
                    )
                  ]),


                )),
            Card(
                margin:EdgeInsets.fromLTRB(3,10,5,2),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(children: [
                    Text(
                      "如何评价「Alicesoft」在11月27日发售的新作《ドーナドーナ》（多娜多娜 一起来干坏事吧）?",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 5,),
                    // Row(children: [],),
                    SizedBox(height: 5,),
                    Text("""日文版刚出时写的评测，直接搬过来。
游戏名：ドーナドーナ いっしょにわるいことをしよう
发行日期：2020-11-27

开发：ALICESOFT

原画：魚介 等

剧本：ダイスころがし

声优：小波すず、金松由花、飴川紫乃、鈴谷まや、東シヅ、榛名れん、百千るか、夏樹柑菜 等

批评空间中央值：85（2020.12.7时）

""".replaceAll(RegExp("\n"), ""),maxLines: 3,overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Tag(text: "李翔",icon: Icons.person,color1: Colors.deepPurpleAccent.withOpacity(0.8),textColor: Colors.grey.shade700,),Spacer(),buildtag("老师问", SQColor.orange,CupertinoIcons.heart_circle_fill),buildtag("老师答", SQColor.golden,CupertinoIcons.checkmark_seal_fill),
                      ],
                    )
                  ]),


                )),
            Card(
                margin: EdgeInsets.fromLTRB(3,10,5,2),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(children: [
                    Text(
                      "如何评价「Alicesoft」在11月27日发售的新作《ドーナドーナ》（多娜多娜 一起来干坏事吧）?",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 5,),
                    // Row(children: [],),
                    SizedBox(height: 5,),
                    Text("""日文版刚出时写的评测，直接搬过来。
游戏名：ドーナドーナ いっしょにわるいことをしよう
发行日期：2020-11-27

开发：ALICESOFT

原画：魚介 等

剧本：ダイスころがし

声优：小波すず、金松由花、飴川紫乃、鈴谷まや、東シヅ、榛名れん、百千るか、夏樹柑菜 等

批评空间中央值：85（2020.12.7时）

""".replaceAll(RegExp("\n"), ""),maxLines: 3,overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Tag(text: "李翔",icon: Icons.person,color1: Colors.deepPurpleAccent.withOpacity(0.8),textColor: Colors.grey.shade700,),Spacer(),buildtag("老师问", SQColor.orange,CupertinoIcons.heart_circle_fill),buildtag("老师答", SQColor.golden,CupertinoIcons.checkmark_seal_fill),
                      ],
                    )
                  ]),


                ))
          ],
        ));
  }

  Widget buildtag(String text,Color color,IconData icon){
    return Container(
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
      decoration: BoxDecoration(
        color: Color.fromARGB(99, color.red, color.green, color.blue),
        border: Border.all(color: Color.fromARGB(99, color.red, color.green, color.blue), width: 0.5),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(children:[Icon(icon,color: color,size: 13,),SizedBox(width: 2,),Text(
        text,
        style: TextStyle(fontSize: 12, color: color,fontWeight: FontWeight.bold),
      ),])
    );

  }
}
