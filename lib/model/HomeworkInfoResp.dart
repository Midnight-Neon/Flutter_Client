class HomeworkInfoResp {
  int code;
  Data data;

  HomeworkInfoResp({this.code, this.data});

  HomeworkInfoResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String sId;
  String title;
  String owner;
  String content;
  List<Ans> ans;
  String startat;
  List<String> tag;
  String cid;
  List<String> ansList;
  List<String> choices;
  int done;

  Data(
      {this.sId,
        this.title,
        this.owner,
        this.content,
        this.ans,
        this.startat,
        this.tag,
        this.cid,
        this.ansList,
        this.choices,
        this.done});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    owner = json['owner'];
    content = json['content'];
    if (json['ans'] != null) {
      ans = new List<Ans>();
      json['ans'].forEach((v) {
        ans.add(new Ans.fromJson(v));
      });
    }
    startat = json['startat'];
    tag = json['ans_list']!=null?json['tag'].cast<String>():[];
    cid = json['cid'];
    ansList = json['ans_list']!=null?json['ans_list'].cast<String>():[];
    choices = json['choices'].cast<String>();
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['owner'] = this.owner;
    data['content'] = this.content;
    if (this.ans != null) {
      data['ans'] = this.ans.map((v) => v.toJson()).toList();
    }
    data['startat'] = this.startat;
    data['tag'] = this.tag;
    data['cid'] = this.cid;
    data['ans_list'] = this.ansList;
    data['choices'] = this.choices;
    data['done'] = this.done;
    return data;
  }
}

class Ans {
  String text;
  List<String> pics;
  bool inperson;
  String uid;
  Reply reply;

  Ans({this.text, this.pics, this.inperson, this.uid, this.reply});

  Ans.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    pics = json['pics'].cast<String>();
    inperson = json['inperson'];
    uid = json['uid'];
    reply = json['reply'] != null ? new Reply.fromJson(json['reply']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['pics'] = this.pics;
    data['inperson'] = this.inperson;
    data['uid'] = this.uid;
    if (this.reply != null) {
      data['reply'] = this.reply.toJson();
    }
    return data;
  }
}

class Reply {
  String text;
  int rank;
  String uid;
  String owner;

  Reply({this.text, this.rank, this.uid, this.owner});

  Reply.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    rank = json['rank'];
    uid = json['uid'];
    owner = json['owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['rank'] = this.rank;
    data['uid'] = this.uid;
    data['owner'] = this.owner;
    return data;
  }
}
