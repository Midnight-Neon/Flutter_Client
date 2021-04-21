class StuListResp {
  int code;
  List<Data> data;

  StuListResp({this.code, this.data});

  StuListResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String iD;
  String name;
  String department;
  String major;
  String group;
  int role=-1;

  Data(
      {this.iD,
        this.name,
        this.department,
        this.major,
        this.group,
        this.role});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    department = json['department'];
    // grades = json['grades'];
    major = json['major'];
    group = json['group'];
    role = json['role']!=null?json['role'].toInt():-1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['name'] = this.name;
    data['department'] = this.department;
    data['major'] = this.major;
    data['group'] = this.group;
    data['role'] = this.role;
    return data;
  }
}
