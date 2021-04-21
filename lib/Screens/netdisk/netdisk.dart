import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:classmanage/components/circle_2_inside_scale.dart';
import 'package:classmanage/components/modal.dart';
import 'package:classmanage/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:intl/intl.dart';
import '../../http.dart';
import 'package:intl/date_symbol_data_local.dart';

class Netdisk extends StatefulWidget {
  final String id;
  final String name;

  const Netdisk({Key key, this.id, this.name}) : super(key: key);
  @override
  _NetdiskState createState() => _NetdiskState();
}

class _NetdiskState extends State<Netdisk> {
  LCObject object;
  List filelist=[];
  @override
  void initState() {

    super.initState();
    initializeDateFormatting();

    getfiles();
  }
  getfiles()async{
    // var resp=await Global.dio.get("/course/${widget.id}/plist");
    // var info= StuListResp.fromJson(json.decode(resp.data.toString()));
    try {
      LCQuery<LCObject> query = LCQuery('files');
      query.whereEqualTo("cid", widget.id);
      var object = await query.first();
      print(object);
      if (object == null) {
        object = LCObject("files");
        object["list"]= [];
        object["cid"]= widget.id;
        object.save();
      }
      this.object = object;
      filelist = object['list'];
      print(filelist);
      setState(() {

      });
    }catch(_){
      BotToast.showSimpleNotification(title: "网络错误");
      return;
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
        "资源",
        style: TextStyle(letterSpacing: 3,fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    elevation: 0,
    ),body: CupertinoPageScaffold(child:filelist.length>0?ListView.separated(itemCount: filelist.length,itemBuilder: (context,i){
      var file=filelist[i];
      print(file);
      print(file['name']);
return ListTile(leading: _buildLeading(file['name'],),title: Text(file['name'],maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),subtitle: Row(
  children: [buildtag(file['owner'], MyColors.Colororange, Icons.open_in_browser_sharp),
    buildtag(file['createon'], MyColors.Colorcyan, Icons.access_time_sharp)],
),trailing: Icon(Icons.more_horiz_rounded),onTap: ()=>{
  showCupertinoModalBottomSheet(
    expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => ModalFit(url: file['url'],name: file['name'],),
  )
},);
    }, separatorBuilder: (BuildContext context, int index)=>
      Divider(height: 2.0, color: MyColors.ColorgreyLight,thickness: 1,)
    ,):Center(child: Container(width: 50,height: 50,child:Circle2InsideScaleLoading(smallCircleColor: MyColors.Colorolive,)),),),
    floatingActionButton: FloatingActionButton(

      backgroundColor: Colors.black,
      onPressed: _upload,
      tooltip: '上传',
      child: Icon(CupertinoIcons.cloud_upload_fill),
    ),
    );
  }
  Widget _buildLeading(String name){
    return Image.asset("assets/icons/"+getFiletype(name)+".png",width: 40,height: 40,);

  }
  _upload() async{
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if(result != null) {
      // File file = File(result.files.single.path);
      BotToast.showLoading();
    try{ var file= await LCFile.fromPath(result.names.single, result.files.single.path);
   var fileResult= await file.save();

   object.addUnique("list", {'url':fileResult.url,'name':result.names.single,'owner':Global.profile.name,'createon':DateFormat("yyyy/MM/dd ahh:mm:ss","zh_CN").format(DateTime.now()),'size':result.files.single.size});
   await object.save();
  await getfiles();}catch(e){
      print(e);
      BotToast.closeAllLoading();

    }

  BotToast.closeAllLoading();
   
    }
  }
  String getFiletype(String name){
    if(name.contains('.zip')||name.contains('.rar')||name.contains('.7z')||name.contains('.jar')) return 'zip';
    if(name.contains('.mp4')||name.contains('.rm')||name.contains('.wmv')) return 'video';
    if(name.contains('.jpg')||name.contains('.png')||name.contains('.jpeg')||name.contains('.gif')||name.contains('.bmp')) return 'pic';
    if(name.contains('.pdf')) return 'pdf';
    if(name.contains('.doc')||name.contains('.docx')) return 'word';
    if(name.contains('.xls')||name.contains('.xlsx')) return 'excel';
    if(name.contains('.ppt')||name.contains('.pptx')) return 'ppt';
    return 'other';
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Icon(
            icon,
            color: color,
            size: 9,
          ),
          SizedBox(
            width: 0.8,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 8, color: color, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
