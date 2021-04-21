class CourseListResp {
  int code;
  List<Data> data;

  CourseListResp({this.code, this.data});

  CourseListResp.fromJson(Map<String, dynamic> json) {
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
  String sId;
  String title;
  String group;
  List<Teacher> teacher;
  List<String> students;
  List<Notifications> notifications;
  List<Null> homeworkUnreply;
  int pnum;
  int homeworkDone;

  Data(
      {this.sId,
        this.title,
        this.group,
        this.teacher,
        this.students,
        this.notifications,
        this.homeworkUnreply,
        this.pnum,
        this.homeworkDone});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    group = json['group'];
    if (json['teacher'] != null) {
      teacher = new List<Teacher>();
      json['teacher'].forEach((v) {
        teacher.add(new Teacher.fromJson(v));
      });
    }
    students = json['students'].cast<String>();
    if (json['notifications'] != null) {
      notifications = new List<Notifications>();
      json['notifications'].forEach((v) {
        notifications.add(new Notifications.fromJson(v));
      });
    }
    if (json['homework_unreply'] != null) {
      // homeworkUnreply = new List<Null>();
      // json['homework_unreply'].forEach((v) {
      //   homeworkUnreply.add(new Null.fromJson(v));
      // });
    }
    pnum = json['pnum'];
    homeworkDone = json['homework_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['group'] = this.group;
    if (this.teacher != null) {
      data['teacher'] = this.teacher.map((v) => v.toJson()).toList();
    }
    data['students'] = this.students;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications.map((v) => v.toJson()).toList();
    }
    if (this.homeworkUnreply != null) {
      // data['homework_unreply'] =
      //     this.homeworkUnreply.map((v) => v.toJson()).toList();
    }
    data['pnum'] = this.pnum;
    data['homework_done'] = this.homeworkDone;
    return data;
  }
}

class Teacher {
  String iD;
  String name;
  String group;

  Teacher({this.iD, this.name, this.group});

  Teacher.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['name'] = this.name;
    data['group'] = this.group;
    return data;
  }
}

class Notifications {
  String title;
  List<String> tag;
  String content;
  String owner;
  String startat;
  String sId;
  int readnum;

  Notifications(
      {this.title,
        this.tag,
        this.content,
        this.owner,
        this.startat,
        this.sId,
        this.readnum});

  Notifications.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    tag = json['tag'].cast<String>();
    content = json['content'];
    owner = json['owner'];
    startat = json['startat'];
    sId = json['_id'];
    readnum = json['readnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['tag'] = this.tag;
    data['content'] = this.content;
    data['owner'] = this.owner;
    data['startat'] = this.startat;
    data['_id'] = this.sId;
    data['readnum'] = this.readnum;
    return data;
  }
}
