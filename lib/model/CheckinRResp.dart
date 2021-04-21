class CheckinRResp {
  int code;
  List<Lists> list;
  List<All> all;

  CheckinRResp({this.code, this.list, this.all});

  CheckinRResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['list'] != null) {
      list = new List<Lists>();
      json['list'].forEach((v) {
        list.add(new Lists.fromJson(v));
      });
    }
    if (json['all'] != null) {
      all = new List<All>();
      json['all'].forEach((v) {
        all.add(new All.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.all != null) {
      data['all'] = this.all.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  String sId;
  String cid;
  int datetime;
  Owner owner;
  String checkid;
  int type;
  int checktime;
  String uid;

  Lists(
      {this.sId,
        this.cid,
        this.datetime,
        this.owner,
        this.checkid,
        this.type,
        this.checktime,
        this.uid});

  Lists.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cid = json['cid'];
    datetime = json['datetime'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    checkid = json['checkid'];
    type = json['type'];
    checktime = json['checktime'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cid'] = this.cid;
    data['datetime'] = this.datetime;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['checkid'] = this.checkid;
    data['type'] = this.type;
    data['checktime'] = this.checktime;
    data['uid'] = this.uid;
    return data;
  }
}

class Owner {
  String name;
  String iD;

  Owner({this.name, this.iD});

  Owner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['ID'] = this.iD;
    return data;
  }
}

class All {
  String sId;
  String cid;
  int datetime;
  Owner owner;
  int num;
  int type;
  List<String> list;

  All(
      {this.sId,
        this.cid,
        this.datetime,
        this.owner,
        this.num,
        this.type,
        this.list});

  All.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cid = json['cid'];
    datetime = json['datetime'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    num = json['num'];
    type = json['type'];

    list = json['list']!=null?json['list'].cast<String>():[];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cid'] = this.cid;
    data['datetime'] = this.datetime;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['num'] = this.num;
    data['type'] = this.type;
    data['list'] = this.list;
    return data;
  }
}
class CheckinEvent {

  String owner;
  DateTime time;
  int type;
  bool isSign;

  CheckinEvent( this.owner, this.time, this.type, this.isSign);
}