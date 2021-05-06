import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:classmanage/components/StarRate.dart';
import 'package:classmanage/components/Tags.dart';
import 'package:classmanage/model/HomeworkInfoResp.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:classmanage/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../http.dart';
import 'Photo_view.dart';

class OverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          //不显示头部水波纹
          showLeading: false,
          //不显示尾部水波纹
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
        );
    }
    return null;
  }
}


class HomeworkScreen extends StatefulWidget {
 final String id;
 final String cid;

  const HomeworkScreen({Key key, this.id, this.cid}) : super(key: key);
  @override
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  int Wb_Select = -1;
  List<String> select_list = [];
  bool ischoseque = false;
  bool isDone=false;
  Data info;
  Ans ans;


  submitHomework()async{
    var text=_publicController.text;
    if((ischoseque&&text.length==0)||(!ischoseque&&Wb_Select==-1)){
      BotToast.showSimpleNotification(title: "未填写内容");
      return;
    }
    List<String> pics=[];
    BotToast.showLoading();
    List<Future<String>> flist=[];
    try{
      assets.forEach((element)  {
        flist.add(_uploadPic(element));
      });
      pics= await Future.wait(flist,);

    }catch(e){
      print(e.toString());
    }

    BotToast.closeAllLoading();
    var resp= await Global.dio.post("/course/${widget.cid}/homework/${widget.id}",data:{'text':text,
        'pics':pics,
        'inperson':isinPerson,"choice":ischoseque?Wb_Select:-1});
    var res=json.decode(resp.data.toString());
    if(res['code']==0){
      BotToast.showSimpleNotification(title: "提交成功");
      updateHomework();

    }


  }
  Future<String> _uploadPic(AssetEntity element) async{
    var title=await element.titleAsync;
    var data=await element.fullData;
    var file=await  LCFile.fromBytes(title, data).save();
    return file.url;
  }
  @override
  void initState() {
    super.initState();
    updateHomework();
  }
  updateHomework() async{
    var resp=await Global.dio.get("/course/${widget.cid}/homework/${widget.id}");
    // print(resp.data.toString());
    var info= HomeworkInfoResp.fromJson(json.decode(resp.data.toString()));
    if(info.code!=0){
      BotToast.showSimpleNotification(title: "网络错误");
      return;
    }
    // print(info.data.ans);
    setState(() {
      this.info=info.data;
      ischoseque=info.data.choices.length>0;
      isDone=info.data.ans.length>0;
      isinPerson=info.data.ans.length>0?info.data.ans[0].inperson:false;
      ans=info.data.ans.length>0?info.data.ans[0]:null;
      select_list=info.data.choices;
    });
    if(isDone){
      _publicController.text=info.data.ans[0].text;
    }
  }




  Widget options(ScrollController sc) {
    return Container(
        //color: Colors.black12,
        child: ListView(
      controller: sc,
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
          ],
        ),
        SizedBox(
          height: 18.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "作答区",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
            padding: EdgeInsets.only(left: 5.0, top: 5.0),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: select_list.length,
                itemBuilder: (context, index) {
                  return InkWell(

                    child: Card(
                      // elevation: 1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(6, 15, 6, 15),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(12, 8, 0, 8),
                                child:

                                    Stack(
                                  children: [
                                    Icon(
                                      CupertinoIcons.checkmark_seal_fill,
                                      size: 24.0,
                                    ),
                                    Icon(Icons.circle),
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(7.5, 3.5, 0, 0),
                                        child: Text(
                                            String.fromCharCode(index + 65),
                                            style:
                                                TextStyle(color: Colors.white)))
                                  ],
                                )),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.fromLTRB(30, 5, 10, 0),
                              child: Text(
                                select_list[index],
                                style: TextStyle(fontSize: 13.0),
                              ),
                            )),
                            Container(
                                padding: EdgeInsets.only(right: 10.0),
                                child: (Wb_Select == index)
                                    ? Icon(Icons.check_circle_rounded)
                                    : SizedBox(width: 28.0))
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Wb_Select = index;
                      });
                      print(index);
                    },
                  );
                }))
      ],
    )
    );
  }

  ThemeData get currentTheme => Theme.of(context);
  Size _size;
  final TocController controller = TocController();
  final TextEditingController _publicController = TextEditingController();
  double _panelHeightOpen;
  double _panelHeightClosed = 95.0;
  bool isinPerson = false;
  List<AssetEntity> assets = [];
  var isDisplayingDetail = true;
  void removeAsset(int index) {
    setState(() {
      assets.removeAt(index);
      if (assets.isEmpty) {
        isDisplayingDetail = false;
      }
    });
  }

  Widget _selectedAssetDeleteButton(int index) {
    return GestureDetector(
      onTap: () => removeAsset(index),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: currentTheme.canvasColor.withOpacity(0.5),
        ),
        child: Icon(
          Icons.close,
          color: currentTheme.iconTheme.color,
          size: 18.0,
        ),
      ),
    );
  }

  Widget _selectedAssetWidget(int index) {
    final AssetEntity asset = assets.elementAt(index);
    return GestureDetector(
      onTap: isDisplayingDetail
          ? () async {
              final List<AssetEntity> result =
                  await AssetPickerViewer.pushToViewer(
                context,
                currentIndex: index,
                previewAssets: assets,
                themeData: AssetPicker.themeData(Color(0xff00bc56)),
              );
              if (result != null && result != assets) {
                assets = List<AssetEntity>.from(result);
                if (mounted) {
                  setState(() {});
                }
              }
            }
          : null,
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            image: AssetEntityImageProvider(asset, isOriginal: false),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: !ischoseque
            ? ListView(controller: sc, children: <Widget>[
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "作答区",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),

          !isinPerson&isDone?Container(): Card(
                    color: SQColor.lightGray,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    elevation: 0,
                    margin: EdgeInsets.all(20),
                    child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          isDone?null:setState(() {
                            isinPerson = !this.isinPerson;
                          });
                        },
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 5, bottom: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_pin_outlined,
                                size: 26,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "线下提交",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              isinPerson ? Icon(Icons.check) : Container()
                            ],
                          ),
                        ))),
                Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: isinPerson
                        ? Container()
                        : Column(children: [
                            TextField(
                              maxLines: 8,
                              minLines: 8,
                              style: TextStyle(fontSize: 16),
                              readOnly: isDone,
                              decoration: InputDecoration(
                                  border: InputBorder.none,


                                  //去掉输入框的下滑线
                                  fillColor: SQColor.lightGray,
                                  filled: true,
                                  hintText: "输入文字答题...",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16.0),
                                  contentPadding: EdgeInsets.all(10.0),
                                  enabledBorder: null,
                                  disabledBorder: null),
                              controller: _publicController,
                            ),
                            assets.length == 0
                                ? Container(child: isDone?Container(child:ListView.builder(scrollDirection: Axis.horizontal,padding: const EdgeInsets.all(10.0),shrinkWrap: true,itemCount: info.ans[0].pics.length,itemBuilder: (context, i) {
                              var item = info.ans[0].pics[i];
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
                                :Container(),)
                                : Container(
                                    height: 120,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: assets.length,
                                      itemBuilder: (BuildContext _, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                            vertical: 16.0,
                                          ),
                                          child:  AspectRatio(
                                            aspectRatio: 1.0,
                                            child: Stack(
                                              children: <Widget>[
                                                Positioned.fill(
                                                    child:_selectedAssetWidget(
                                                        index)),
                                                AnimatedPositioned(
                                                  duration:
                                                      kThemeAnimationDuration,
                                                  top: isDisplayingDetail
                                                      ? 6.0
                                                      : -30.0,
                                                  right: isDisplayingDetail
                                                      ? 6.0
                                                      : -30.0,
                                                  child:
                                                      _selectedAssetDeleteButton(
                                                          index),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                           isDone? Container():Card(
                                color: SQColor.lightGray,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                elevation: 0,
                                margin: EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () async {
                                    var assrts = await AssetPicker.pickAssets(
                                      context,
                                      selectedAssets: assets,
                                      requestType: RequestType.image,
                                    );
                                    if (assrts == null) return;
                                    setState(() {
                                      assets = assrts;
                                    });
                                  },
                                  child: Container(
                                    height: 60,
                                    padding: EdgeInsets.only(
                                        left: 30, right: 30, top: 5, bottom: 5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.photo,
                                          size: 26,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "添加图片",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ])),
         if(ans!=null&&ans.reply!=null)
           ...[SizedBox(height: 20,),
           Stack(
             children: [
               Divider(
                 height: 20.0,
                 indent: 15.0,
                 endIndent: 200.0,
                 color: Colors.black45,
               ),
               Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [Icon(Icons.stars_rounded, size: 20.0)]),
               Divider(
                 height: 20.0,
                 indent: 200.0,
                 endIndent: 15.0,
                 color: Colors.black45,
               )
             ],
           ),
           SizedBox(height: 10,),

           RatingBar(value: ans.reply.rank.toDouble(),),
           Container(child: Text(
             "评语:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
             textAlign: TextAlign.left,), padding: EdgeInsets.only(left: 30),),
           Text(ans.reply.text,
             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
             textAlign: TextAlign.center,),
           // Container(child:Tag(text: ans.reply.owner,icon: Icons.person,color1: MyColors.Colorolive,),padding: EdgeInsets.only(right: 20),),
           //   Container(child: Text("---${ans.reply.owner}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),padding: EdgeInsets.only(right: 30),),
         ],
          Container(
                    margin: EdgeInsets.all(20),
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              //设置按下时的背景颜色
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.white;
                              }
                              //默认不使用背景颜色
                              return Colors.black;
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                if (states.contains(MaterialState.focused) &&
                                    !states.contains(MaterialState.pressed)) {
                                  //获取焦点时的颜色
                                  return Colors.black;
                                } else if (states
                                    .contains(MaterialState.pressed)) {
                                  //按下时的颜色
                                  return Colors.black;
                                }
                                //默认状态使用灰色
                                return Colors.white;
                              },
                            ),
                            overlayColor:
                                MaterialStateProperty.all(Colors.black45),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(10))),
                        onPressed: () async{
                          if(isDone) return;
                         submitHomework();


                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isDone?Icons.check_circle:Icons.cloud_upload,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(isDone?"已提交":"提交"),

                          ],
                        ))),
              ])
            : options(sc));
  }

  @override
  Widget build(BuildContext context) {
    // select_list.clear();
    // select_list.add("选世界");
    // select_list.add("选桂言叶");
    // select_list.add("你们都是我的翅膀");
    // select_list.add("我是男酮");
    // select_list.add("告诉自己别睡了");
    // select_list.add(
    //     "在这段时间里，我和你经历了很多，我看着你从当初那个懵懂无知的少女，变成了如今罗德岛的领导人，萨卡兹的王，但是我知道，凯尔希知道，所有干员都知道，你仍是那个温柔的小兔，无论你带上了什么样子面具，你都只能是你自己");
    //
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;
    _size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title:info!=null? Text(info.title):Container(),
          centerTitle: true,
        ),
        body: SlidingUpPanel(
          panelBuilder: (sc) => _panel(sc),
          minHeight: 70,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
          body: Card(
            child: buildMarkdown(),
            elevation: 20,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 140),
          ),
        ));
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  Widget buildMarkdown() {
    return Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(bottom: 10),
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: info!=null?MarkdownWidget(
            data: info.content,
            controller: controller,
            physics: ClampingScrollPhysics(),
            styleConfig: StyleConfig(
                pConfig: PConfig(
                    linkGesture: (linkChild, url) {
                      return GestureDetector(
                        child: linkChild,
                        onTap: () => _launchURL(url),
                      );
                    },
                    selectable: false),
                preConfig: PreConfig(
                  preWrapper: (child, text) =>
                      buildCodeBlock(child, text, false),
                ),
                tableConfig: TableConfig(
                  defaultColumnWidth: FixedColumnWidth(50),
                  headChildWrapper: (child) => Container(
                    margin: EdgeInsets.all(10.0),
                    child: child,
                    alignment: Alignment.center,
                  ),
                  bodyChildWrapper: (child) => Container(
                    margin: EdgeInsets.all(10.0),
                    child: child,
                    alignment: Alignment.center,
                  ),
                ),
                markdownTheme: MarkdownTheme.lightTheme),
          ):Container(),
        ));
  }

  Widget buildCodeBlock(Widget child, String text, bool isEnglish) {
    return Stack(
      children: <Widget>[
        child,
        Container(
          margin: EdgeInsets.only(top: 5, right: 5),
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: text));
            },
            icon: Icon(
              Icons.content_copy,
              size: 16,
            ),
          ),
        )
      ],
    );
  }
}
