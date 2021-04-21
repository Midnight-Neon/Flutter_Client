import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/Screens/Homework.dart';
import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/constants.dart';
import 'package:classmanage/model/HomeworkResp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../http.dart';

class HomeworkList extends StatefulWidget {
  final String id;

  const HomeworkList({Key key, this.id}) : super(key: key);
  @override
  _HomeworkListState createState() => _HomeworkListState();
}

class _HomeworkListState extends State<HomeworkList> {

  List<Data> homeworklist=[];
  updateList() async{
    var resp=await Global.dio.get("/course/${widget.id}/homeworks");
    // print(resp.data.toString());
    var info= HomeworkListResp.fromJson(json.decode(resp.data.toString()));
    if(info.code!=0){
      BotToast.showSimpleNotification(title: "网络错误");
      return;
    }
    setState(() {
      homeworklist=info.data;
    });

  }
  @override
  void initState() {
    super.initState();
    updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('作业'),
        centerTitle: true,
      ),body: ListView.builder(itemCount: homeworklist.length,itemBuilder: (context,i){
        var item=homeworklist[i];
        return Card(
            margin: EdgeInsets.fromLTRB(3, 10, 5, 2),
            elevation: 5,
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeworkScreen(id:item.sId,cid: widget.id,))).then((value) => updateList())
                  },
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Row(children: [],),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item.content
                              .replaceAll(RegExp("#"), "").replaceAll(RegExp("\n\n"), "\n").replaceAll(RegExp("\\*"), "") ,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Tag(
                              text: item.owner,
                              icon: Icons.person,
                              color1:
                              Colors.deepPurpleAccent.withOpacity(0.8),
                              textColor: Colors.grey.shade700,
                            ),
                            Spacer(),
                            for(var i in item.tag) buildtag(i, MyColors.Colororange, CupertinoIcons.tag)
                          ],
                        )
                      ]),
                )));
    }),);
  }
  Widget buildtag(String text, Color color, IconData icon) {
    return Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
        decoration: BoxDecoration(
          color: Color.fromARGB(99, color.red, color.green, color.blue),
          border: Border.all(
              color: Color.fromARGB(99, color.red, color.green, color.blue),
              width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(children: [
          Icon(
            icon,
            color: color,
            size: 13,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12, color: color, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
