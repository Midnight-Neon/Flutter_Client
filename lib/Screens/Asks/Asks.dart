import 'package:classmanage/Screens/Asks/AskNew.dart';
import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AskView.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AskNew();
            }));
          },
          child: Icon(CupertinoIcons.add),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Card(
              margin: EdgeInsets.fromLTRB(3, 10, 5, 2),
              elevation: 5,
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AskView()))
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "如何评价「Alicesoft」在11月27日发售的新作《ドーナドーナ》（多娜多娜 一起来干坏事吧）?",
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
                            """日文版刚出时写的评测，直接搬过来。
游戏名：ドーナドーナ いっしょにわるいことをしよう
发行日期：2020-11-27

开发：ALICESOFT

原画：魚介 等

剧本：ダイスころがし

声优：小波すず、金松由花、飴川紫乃、鈴谷まや、東シヅ、榛名れん、百千るか、夏樹柑菜 等

批评空间中央值：85（2020.12.7时）

"""
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
                                text: "李翔",
                                icon: Icons.person,
                                color1:
                                    Colors.deepPurpleAccent.withOpacity(0.8),
                                textColor: Colors.grey.shade700,
                              ),
                              Spacer(),
                              buildtag("老师问", SQColor.orange,
                                  CupertinoIcons.heart_circle_fill),
                              buildtag("未回答", SQColor.blue,
                                  CupertinoIcons.clear_thick_circled),
                            ],
                          )
                        ]),
                  )),
            ),
            Card(
                margin: EdgeInsets.fromLTRB(3, 10, 5, 2),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(children: [
                    Text(
                      "如何评价「Alicesoft」在11月27日发售的新作《ドーナドーナ》（多娜多娜 一起来干坏事吧）?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Row(children: [],),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      """日文版刚出时写的评测，直接搬过来。
游戏名：ドーナドーナ いっしょにわるいことをしよう
发行日期：2020-11-27

开发：ALICESOFT

原画：魚介 等

剧本：ダイスころがし

声优：小波すず、金松由花、飴川紫乃、鈴谷まや、東シヅ、榛名れん、百千るか、夏樹柑菜 等

批评空间中央值：85（2020.12.7时）

"""
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
                          text: "李翔",
                          icon: Icons.person,
                          color1: Colors.deepPurpleAccent.withOpacity(0.8),
                          textColor: Colors.grey.shade700,
                        ),
                        Spacer(),
                        buildtag("老师答", SQColor.golden,
                            CupertinoIcons.checkmark_seal_fill),
                      ],
                    )
                  ]),
                )),
            Card(
                margin: EdgeInsets.fromLTRB(3, 10, 5, 2),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(children: [
                    Text(
                      "如何评价「Alicesoft」在11月27日发售的新作《ドーナドーナ》（多娜多娜 一起来干坏事吧）?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Row(children: [],),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      """日文版刚出时写的评测，直接搬过来。
游戏名：ドーナドーナ いっしょにわるいことをしよう
发行日期：2020-11-27

开发：ALICESOFT

原画：魚介 等

剧本：ダイスころがし

声优：小波すず、金松由花、飴川紫乃、鈴谷まや、東シヅ、榛名れん、百千るか、夏樹柑菜 等

批评空间中央值：85（2020.12.7时）

"""
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
                          text: "李翔",
                          icon: Icons.person,
                          color1: Colors.deepPurpleAccent.withOpacity(0.8),
                          textColor: Colors.grey.shade700,
                        ),
                        Spacer(),
                        buildtag("老师问", SQColor.orange,
                            CupertinoIcons.heart_circle_fill),
                        buildtag("老师答", SQColor.golden,
                            CupertinoIcons.checkmark_seal_fill),
                      ],
                    )
                  ]),
                )),
            Card(
                margin: EdgeInsets.fromLTRB(3, 10, 5, 2),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "萝莉吸血鬼！～与吸血鬼姐妹的性福生活～",
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
                          """没有梦想…也没有女朋友…在便利店里做着兼职…
就这样保持着孤零零的状态寂寞地度过余生，已经对自己的人生完全断念的主人公。
因某次事故而倒下的他，醒来后发现救起自己的少女竟然是……吸血鬼！？
 
「拜、托……让我、亲一下、好吗……」
 
顺应要求让她吸取自己血液的瞬间，
异常程度的性欲忽然涌上了主人公的全身。
差点忘了——吸血鬼的唾液，有着催情的作用！！
 
自称是她的妹妹、另一位吸血鬼也随后造访了家里，
与吸血鬼姐妹的同居生活旋即拉开了帷幕。
被娇小的两只吸血鬼幼女包围，主人公焕然一新的性生活开始了。

"""
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
                              text: "无法可说",
                              icon: Icons.person,
                              color1: Colors.deepPurpleAccent.withOpacity(0.8),
                              textColor: Colors.grey.shade700,
                            ),
                            Spacer(),
                            buildtag("已回答", SQColor.secondary,
                                CupertinoIcons.check_mark_circled_solid),
                          ],
                        )
                      ]),
                )),
            Card(
                margin: EdgeInsets.fromLTRB(3, 10, 5, 2),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(children: [
                    Text(
                      "哥哥，早上起床之前都要抱紧我哦！晚上睡觉之前做更多色色的事吧！",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Row(children: [],),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      """「还要一直和妹妹抱抱哦」
 
和妹妹们愉快地度过了圣诞的几天后，
幸福度日的女未家接下来即将迎来正月。
 
一天到晚和妹妹打情骂俏、
夜晚则让她们陪睡并做些色色的事情、
当然每天的拥抱任务也按序达成……
 
看似不变的日常，在接下来新年的3天里则会变得稍稍特别。
 
本作便是接续前作后宫路线的后日谈。
要和变得更亲密的妹妹们一起更愉快地睡着度过正月吗？

"""
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
                          text: "无法可说",
                          icon: Icons.person,
                          color1: Colors.deepPurpleAccent.withOpacity(0.8),
                          textColor: Colors.grey.shade700,
                        ),
                        Spacer(),
                        buildtag("老师问", SQColor.orange,
                            CupertinoIcons.heart_circle_fill),
                        buildtag("已回答", SQColor.secondary,
                            CupertinoIcons.check_mark_circled_solid),
                      ],
                    )
                  ]),
                ))
          ],
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
