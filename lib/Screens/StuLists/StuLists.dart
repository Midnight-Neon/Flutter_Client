import 'package:azlistview/azlistview.dart';
import 'package:classmanage/constants.dart';
import 'package:classmanage/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lpinyin/lpinyin.dart';

class StudentLists extends StatefulWidget {
  @override
  _StudentListsState createState() => _StudentListsState();
}

class _StudentListsState extends State<StudentLists> {
  List<ContactInfo> contactList = [];
  List<ContactInfo> topList = [];

  void loadData() async {
    topList.add(ContactInfo(name:"张国平",tagIndex:"☆",bgColor: Colors.orange,));
    topList.add(ContactInfo(name:"李翔",tagIndex:"☆",bgColor: SQColor.secondary,));
    topList.add(ContactInfo(name:"张羽嘉",tagIndex:"☆",bgColor: SQColor.secondary,));
contactList.add(ContactInfo(name:"张国平", bgColor: Colors.orange,));
contactList.add(ContactInfo(name:"李翔", bgColor: SQColor.secondary,));
contactList.add(ContactInfo(name:"张羽嘉", bgColor: SQColor.secondary,));
    contactList.add(ContactInfo(name:"张国平", bgColor: Colors.orange,));
    contactList.add(ContactInfo(name:"李翔", bgColor: SQColor.secondary,));
    contactList.add(ContactInfo(name:"张羽嘉", bgColor: SQColor.secondary,));contactList.add(ContactInfo(name:"张国平", bgColor: Colors.orange,));
    contactList.add(ContactInfo(name:"李翔", bgColor: SQColor.secondary,));
    contactList.add(ContactInfo(name:"张羽嘉", bgColor: SQColor.secondary,));contactList.add(ContactInfo(name:"张国平", bgColor: Colors.orange,));
    contactList.add(ContactInfo(name:"李翔", bgColor: SQColor.secondary,));
    contactList.add(ContactInfo(name:"张羽嘉", bgColor: SQColor.secondary,));
_handleList(contactList);
  }
  void _handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contactList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(contactList);
contactList.insertAll(0, topList);

    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    loadData();
  }
   Widget getWeChatListItem(
      BuildContext context,
      ContactInfo model, {
        Color defHeaderBgColor,
      }) {
    DecorationImage image;
//    if (model.img != null && model.img.isNotEmpty) {
//      image = DecorationImage(
//        image: CachedNetworkImageProvider(model.img),
//        fit: BoxFit.contain,
//      );
//    }
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          color: model.bgColor ?? defHeaderBgColor,
          image: image,
        ),
        child: model.iconData == null
            ? null
            : Icon(
          model.iconData,
          color: Colors.white,
          size: 20,
        ),
      ),
      title: Text(model.name),
      onTap: () {

      },
    );
  }
  Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40}) {
    if (tag == '★') {
      tag = '★ 收藏';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  Widget _buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        // Offstage(
        //   offstage: model.isShowSuspension != true,
        //   child: _buildSusWidget(susTag),
        // ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: model.bgColor==null?Colors.blue[700]:model.bgColor,
            child: Text(
              model.name[0],
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text(model.name),
          onTap: () {

          },
        )
      ],
    );
  }
  Widget _buildSusWidget(String susTag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: 40,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Text(
            '$susTag',
            textScaleFactor: 1.2,
          ),
          Expanded(
              child: Divider(
                height: .0,
                indent: 10.0,
              ))
        ],
      ),
    );
  }
  Decoration getIndexBarDecoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey[300], width: .5));
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar:AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.dark,
      title: Text(
        "班级成员",
        style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    ),body: AzListView(
      data: contactList,
      padding: EdgeInsets.only(top: 20),
      itemCount: contactList.length,
      itemBuilder: (BuildContext context, int index) {
        ContactInfo model = contactList[index];
        return _buildListItem(model);
      },physics: BouncingScrollPhysics(),
      susItemBuilder: (BuildContext context, int index) {
        ContactInfo model = contactList[index];

        return getSusItem(context, model.getSuspensionTag());
      },
      indexBarData:  SuspensionUtil.getTagIndexList(contactList),
      indexBarOptions: IndexBarOptions(
        needRebuild: true,
        ignoreDragCancel: true,
        downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
        downItemDecoration:
        BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        indexHintWidth: 120 / 2,
        indexHintHeight: 100 / 2,
        indexHintDecoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/ic_index_bar_bubble_gray.png"),
            fit: BoxFit.contain,
          ),
        ),
        indexHintAlignment: Alignment.centerRight,
        indexHintChildAlignment: Alignment(-0.25, 0.0),
        indexHintOffset: Offset(-20, 0),
      ),
    ),);
  }
}
