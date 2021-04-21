import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/Screens/Asks/AskNew.dart';
import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/constants.dart';
import 'package:classmanage/model/AsksLists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../http.dart';
import 'AskView.dart';

class AskList extends StatefulWidget {
  final String  id;

  const AskList({Key key, this.id}) : super(key: key);

  @override
  _AskListState createState() => _AskListState();
}

class _AskListState extends State<AskList> {
  List<Data> askslist=[];
  updateList() async{
    var resp=await Global.dio.get("/course/${widget.id}/asks");
    // print(resp.data.toString());
    var info= AskListReply.fromJson(json.decode(resp.data.toString()));
    if(info.code!=0){
      BotToast.showSimpleNotification(title: "网络错误");
      return;
    }
    setState(() {
      askslist=info.data;
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
          title: Text('讨论区'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AskNew(id: widget.id,);
            })).then((value) => updateList());
          },
          child: Icon(CupertinoIcons.add),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: askslist.length,
          itemBuilder: (context,i){
            var item=askslist[i];
            return Card(
              margin: EdgeInsets.fromLTRB(3, 10, 5, 2),
              elevation: 5,
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AskView(id:item.sId,cid: widget.id,))).then((value) => updateList())
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
                                .replaceAll(RegExp("\n"), ""),
                            maxLines: 3,
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
                              item.role==Role.Teacher?buildtag("老师问", SQColor.orange,
                                  CupertinoIcons.heart_circle_fill):Container(),
                             item.reply.length==0? buildtag("未回答", SQColor.blue,
                                  CupertinoIcons.clear_thick_circled):Container(),
                              item.treply!=0? buildtag("老师答", SQColor.golden,
                                  CupertinoIcons.checkmark_seal_fill):Container(),
                            ],
                          )
                        ]),
                  )));
          },
        ));
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
