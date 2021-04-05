import 'package:cached_network_image/cached_network_image.dart';
import 'package:classmanage/Screens/Homework.dart';
import 'package:classmanage/Screens/Photo_view.dart';
import 'package:classmanage/components/Tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import 'ExpandableText.dart';

class AskView extends StatefulWidget {
  @override
  _AskViewState createState() => _AskViewState();
}

class OneAsk {
  int index;
  IconData head;
  String askper;
  String askthing;
  bool isTeacher;
  OneAsk(this.index, this.head, this.askper, this.askthing, this.isTeacher);
}

class _AskViewState extends State<AskView> {
  int Wb_Select = 0;
  List<String> select_list=[];
  bool ischoseque = true;
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;
  List<OneAsk> asklist = [];
  String quetitle = "哥哥，早上起床之前都要抱紧我哦！晚上睡觉之前做更多色色的事吧！";
  String ques = """
「还要一直和妹妹抱抱哦」
和妹妹们愉快地度过了圣诞的几天后，
幸福度日的女未家接下来即将迎来正月。
一天到晚和妹妹打情骂俏、
夜晚则让她们陪睡并做些色色的事情、
当然每天的拥抱任务也按序达成……
看似不变的日常，在接下来新年的3天里则会变得稍稍特别。
本作便是接续前作后宫路线的后日谈。
要和变得更亲密的妹妹们一起更愉快地睡着度过正月吗？
""";
  List<String> assets = ["https://images.unsplash.com/photo-1519865885898-a54a6f2c7eea?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=695&q=80"];

  @override
  void initState() {
    super.initState();
    print(" 初始化");
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      //print("监听开始");
      // print(_controller.offset); //打印滚动位置
      if (_controller.offset < 60 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 60 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }
  Widget options()
  {
    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 5.0),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: select_list.length,
          itemBuilder:(context, index){
              return InkWell(
                child:Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(6, 15, 6, 15),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(12, 8,0, 8),
                        child:
                        // new Container(
                        //   width: 20.0,
                        //   height: 20.0,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color:Colors.black
                        //   ),
                        //   child: Container(
                        //     padding: EdgeInsets.fromLTRB(5.5, 2, 0, 0),
                        //       child:Text(String.fromCharCode(index+65),style:TextStyle(
                        //     color:Colors.white
                        //   )))
                        // )
                          Stack(
                            children: [
                              Icon(CupertinoIcons.checkmark_seal_fill,size: 24.0,),
                              Icon(Icons.circle),
                              Container(
                                padding: EdgeInsets.fromLTRB(7.5, 3.5, 0, 0),
                              child:Text(String.fromCharCode(index+65),style:TextStyle(
                                   color:Colors.white
                                 ))
                              )
                            ],
                          )
                        ),
                        Expanded(
                        child:Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                          child: Text(select_list[index],
                          style: TextStyle(
                            fontSize: 13.0
                          ),),
                        )),
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                        child:(Wb_Select==index)?Icon(Icons.check_circle_rounded):SizedBox(width: 28.0)
                        )
                          ],
                    ),
                  ),
                ) ,
                onTap:(){
                  setState(() {
                    Wb_Select = index;
                  });
                  print(index);
                },
              );
          }
      )
    );
  }
  Widget quelisttile(OneAsk oneAsk) {
    return Column(
      children: [
        new Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 5.0, top: 5.0),
                    child: Row(children: [
                      Icon(oneAsk.head, color: Colors.amberAccent),
                      SizedBox(width: 2.0),
                      Text(oneAsk.askper,
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.black38)),
                      Spacer(),
                      oneAsk.isTeacher
                          ? buildtag("教师", SQColor.golden,
                              CupertinoIcons.checkmark_seal_fill)
                          : Transform.scale(
                              scale: 0.8,
                              child: Tag(
                                text: "Lv.1",
                                color1: SQColor.golden,
                                image: SvgPicture.asset(
                                  "assets/icons/model.svg",
                                  width: 13,
                                  height: 13,
                                ),
                              )),
                    ])),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: ExpandableText(
                      text: oneAsk.askthing,
                      maxLines: 3,
                      style: TextStyle(fontSize: 13.0)),
                )
              ],
            )),
        SizedBox(height: 2.5)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    select_list.clear();
    select_list.add("选世界");
    select_list.add("选桂言叶");
    select_list.add("你们都是我的翅膀");
    select_list.add("我是男酮");
    select_list.add("告诉自己别睡了");
    select_list.add("在这段时间里，我和你经历了很多，我看着你从当初那个懵懂无知的少女，变成了如今罗德岛的领导人，萨卡兹的王，但是我知道，凯尔希知道，所有干员都知道，你仍是那个温柔的小兔，无论你带上了什么样子面具，你都只能是你自己");
    asklist.clear();
    asklist.add(new OneAsk(
        0,
        Icons.person,
        "萨顶顶",
        "本质都是文字作品，而且galgame对空间,图像等想象力要求没那么高（而且可以直接快进过剧情。）。所以我觉着看不进书的时候玩几个好的galgame是很好的。",
        false));
    asklist.add(new OneAsk(1, Icons.person, "李翔",
        "萝莉控爱的不行，画风什么的也没得说真的顶，美中不足就是太顶了身体撑不住。第一部攻略一条线可以把我榨干", true));
    asklist.add(new OneAsk(
        2,
        Icons.person_outline,
        "点光源",
        "很有意思，起码我是真的感觉治愈了？害推荐玩了第一部再来玩这部（不然你看不懂，上来就来OO确实太突然了）推荐玩的，4个妹妹都各有各的萌点，推荐玩的",
        true));
    asklist.add(new OneAsk(
        3,
        Icons.person_outline,
        "地平线",
        """
【いわらも】 开启后宫路线
【てちてこ】 播放游戏 OP
【そまもも】 播放空线 ED
【てひるつ】 播放茜线 ED
【こくみけ】 播放琥珀线 ED
【なやわな】 播放澄线 ED
【とりすも】 播放后宫线 ED
【いすゆそ】 显示 綾音まこ 的留言
【ぬよえゆ】 显示 花影蛍 的留言
【つそきう】 显示 御子柴こよ 的留言
【へしつく】 显示 綾瀬あかり 的留言
【ちひろほ】 显示 K子 的留言
        """,
        false));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          showToTopBtn ? quetitle : "",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: ListView(
            controller: _controller,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(quetitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            height: 1.2,
                            // decorationStyle: TextDecorationStyle.dashed
                          )),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Row(
                            children: [
                              Spacer(),
                              Transform.scale(
                                  scale: 0.8,
                                  child: Tag(
                                    text: "Lv.1",
                                    color1: SQColor.golden,
                                    image: SvgPicture.asset(
                                      "assets/icons/model.svg",
                                      width: 13,
                                      height: 13,
                                    ),
                                  )),
                              Text("李翔",
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black38
                                  )),
                            ]
                        ),
                      ),
                      SizedBox(height: 5),
                      ExpandableText(
                          text: ques,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 13.0,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      assets.length == 0
                          ? Container()
                          : Container(child:ListView.builder(scrollDirection: Axis.horizontal,padding: const EdgeInsets.all(10.0),shrinkWrap: true,itemCount: assets.length,itemBuilder: (context, i) {
                              var item = assets[i];
                              return GestureDetector(
                                onTap: () {
                                  return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PhotoPreview(
                                                imageProvider:
                                                    CachedNetworkImageProvider(
                                                        item),
                                              )));
                                },child:ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child:  CachedNetworkImage(imageUrl: item,height: 80,),

                              ),);
                            }),height: 100,)
                    ],
                  )),
              SizedBox(height: 5.0),
              ischoseque?
              options()
                  :Container(
                child: Column(
                  children: [
                    Container(
                        color: Colors.white,
                        padding:
                            EdgeInsets.only(top: 6.0, left: 5.0, bottom: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("回答",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  fontSize: 14.0,
                                )),
                            SizedBox(width: 2.0),
                            Text(asklist.length.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    height: 1.2))
                          ],
                        )),
                    SizedBox(height: 0.5),
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: asklist.length,
                        itemBuilder: (context, index) {
                          return quelisttile(asklist[index]);
                        })
                  ],
                ),
              )
            ],
          )),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.endFloat, 0, -30),
      floatingActionButton: ischoseque?Container():FloatingActionButton(
          child: Icon(CupertinoIcons.ellipses_bubble_fill),
          backgroundColor: Colors.black,
         ),
    );
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
            size: 10,
          ),
          SizedBox(
            width: 1,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 10, color: color, fontWeight: FontWeight.bold),
          ),
        ]));
  }


}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX; // X方向的偏移量
  double offsetY; // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}
