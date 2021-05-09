class pushModel {
  String cid;
  int type;
  String id;

  pushModel({this.cid, this.type, this.id});

  pushModel.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}
