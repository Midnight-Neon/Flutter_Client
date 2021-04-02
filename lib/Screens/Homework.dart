import 'package:classmanage/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

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
  @override
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  String data = """
  

## 第一次作业

某列车调度站的铁道联接结构如 Figure 1 所示。

其中，A 为入口，B 为出口，S 为中转盲端。所有铁道均为单轨单向式：列车行驶的方向只能是从 A 到 S，再从 S 到 B；另外，**不允许超车**。因为车厢可在 S 中驻留，所以它们从 B 端驶出的次序，可能与从 A 端驶入的次序不同。不过 S 的容量有限，同时驻留的车厢不得超过 m 节。

设某列车由编号依次为 {1, 2, ..., n} 的 n 节车厢组成。调度员希望知道，按照以上交通规则，这些车厢能否以 {a1, a2, ..., an} 的次序，重新排列后从 B 端驶出。如果可行，应该以怎样的次序操作?

#### 输入

共两行。第一行为两个整数 n，m。第二行为以空格分隔的 n 个整数，保证为 {1, 2, ..., n} 的一个排列，表示待判断可行性的驶出序列{a1，a2，...，an}。

\$Latex\$
```
#include <stdio.h>
#define MANX 100005

int Stack[MANX];
int Out[MANX];
int sTop=0;	//栈顶指针

void push(int a)
{
	Stack[++sTop]=a;
}

void pop()
{
	sTop--;
}

int top()
{
	return Stack[sTop];
}

int main()
{
	// in 的时候一定是{1, 2, ..., n}
	int n,m;
	scanf("%d%d",&n,&m);
	
	int i;
	for(i=1;i<=n;i++)
		scanf("%d",&Out[i]);
	
	//算法开始
	int j=0;
	for(i=1;i<=n;i++)
	{
		//如果小于栈顶元素，直接可判断在栈中而无法出栈
		if(Out[i]<top())
		{
			printf("No\\n");
			return 0;
		}

		//直到 Out[i] 的元素全部加入栈
		if(j<Out[i])
			while(j!=Out[i])
				push(++j);
		
		if(sTop>m)
		{
			printf("No\\n");
			return 0;
		}
		
		if(Out[i]==top())
			pop();
	}

	printf("Yes\\n");
	
	return 0;
}
```



""";
  ThemeData get currentTheme => Theme.of(context) ;
  Size  _size;
  final TocController controller = TocController();
  final TextEditingController _publicController = TextEditingController();
  double _panelHeightOpen;
  double _panelHeightClosed = 95.0;
  bool isinPerson=false;
  List<AssetEntity> assets=[];
  var isDisplayingDetail=true;
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
        child: ListView(controller: sc, children: <Widget>[
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
          Card(
              color: SQColor.lightGray,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              elevation: 0,
              margin: EdgeInsets.all(20),
              child:GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    setState(() {
                      isinPerson=!this.isinPerson;
                    });
                  },
                  child: Container(
                height: 60,
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                    ),
                    Spacer(),
                    isinPerson?Icon(Icons.check):Container()
                  ],
                ),
              ))),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:isinPerson?Container(): Column(children:[TextField(
                maxLines: 8,
                minLines: 8,

                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    border: InputBorder.none,

                    //去掉输入框的下滑线
                    fillColor: SQColor.lightGray,
                    filled: true,

                    hintText: "输入文字答题...",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                    contentPadding: EdgeInsets.all(10.0),
                    enabledBorder: null,
                    disabledBorder: null),
                controller: _publicController,
              ),
                assets.length==0?Container():Container(
                    height:120,child:ListView.builder(
                    shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: assets.length,
                  itemBuilder: (BuildContext _, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 16.0,
                      ),
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(child: _selectedAssetWidget(index)),
                            AnimatedPositioned(
                              duration: kThemeAnimationDuration,
                              top: isDisplayingDetail ? 6.0 : -30.0,
                              right: isDisplayingDetail ? 6.0 : -30.0,
                              child: _selectedAssetDeleteButton(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),

                Card(
                    color: SQColor.lightGray,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    elevation: 0,
                    margin: EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                       var assrts= await AssetPicker.pickAssets(context,selectedAssets:assets,requestType: RequestType.image,);
                      if (assrts==null) return;
                       setState(() {
                        assets=assrts;
                      });
                      },
                      child: Container(
                        height: 60,
                        padding:
                        EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
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
                              style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
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
                          } else if (states.contains(MaterialState.pressed)) {
                            //按下时的颜色
                            return Colors.black;
                          }
                          //默认状态使用灰色
                          return Colors.white;
                        },
                      ),
                      overlayColor: MaterialStateProperty.all(Colors.black45),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("提交")
                    ],
                  ))),

        ]));
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;
    _size= MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Markdown Page'),
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
          child: MarkdownWidget(
            data: data,
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
          ),
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
