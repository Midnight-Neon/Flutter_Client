import 'package:classmanage/constants.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../Homework.dart';

class AskNew extends StatefulWidget {
  @override
  _AskNewState createState() => _AskNewState();
}

class _AskNewState extends State<AskNew> {
  ThemeData get currentTheme => Theme.of(context) ;
  Size  _size;
  final TextEditingController _publicController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  List<AssetEntity> assets=[];
  var isDisplayingDetail=true;
  void removeAsset(int index) {
    setState(() {
      assets.removeAt(index);
      if (assets.isEmpty) {
        isDisplayingDetail = false;
      }
    });
  }  Widget _selectedAssetDeleteButton(int index) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('讨论区'),
    centerTitle: true,
    ),body:           Container(
        padding: EdgeInsets.only(top: 0,left: 20, right: 20),
        child:  ScrollConfiguration(
    behavior: OverScrollBehavior(),
    child: ListView(children:[
          SizedBox(height: 20,),
          TextField(

          // minLines: 2,

          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
              border: InputBorder.none,

              //去掉输入框的下滑线
              fillColor: SQColor.lightGray,
              filled: true,

              hintText: "输入标题...",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
              contentPadding: EdgeInsets.all(10.0),
              enabledBorder: null,
              disabledBorder: null),
          controller: _titleController,
        ),SizedBox(height: 10,)
          ,TextField(
          maxLines: 8,
          minLines: 8,

          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
              border: InputBorder.none,

              //去掉输入框的下滑线
              fillColor: SQColor.lightGray,
              filled: true,

              hintText: "输入内容文字...",
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
              )), SizedBox(height: 20,),
      TextButton(
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
          )), SizedBox(height: 20,),
        ])),));
  }
}
