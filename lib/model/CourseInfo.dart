class CourseInfoResp {
  int code;
  Data data;

  CourseInfoResp({this.code, this.data});

  CourseInfoResp.fromJson(Map<String, dynamic> json) {
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
  String group;
  List<Teacher> teacher;
  List<String> students;
  List<Notifications> notifications;
  List<Null> homeworkUnreply;
  int pnum;
  int homeworkDone;
  String uid;
  String cid;
  String uname;
  int homeworkUndone;
  List<Null> homeworkreply;
  List<Null> askreply;
  List<String> notificationsDone;

  Data(
      {this.sId,
        this.title,
        this.group,
        this.teacher,
        this.students,
        this.notifications,
        this.homeworkUnreply,
        this.pnum,
        this.homeworkDone,
        this.uid,
        this.cid,
        this.uname,
        this.homeworkUndone,
        this.homeworkreply,
        this.askreply,
        this.notificationsDone});

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
    uid = json['uid'];
    cid = json['cid'];
    uname = json['uname'];
    homeworkUndone = json['homework_undone'];
    if (json['homeworkreply'] != null) {
      // homeworkreply = new List<Null>();
      // json['homeworkreply'].forEach((v) {
      //   homeworkreply.add(new Null.fromJson(v));
      // });
    }
    if (json['askreply'] != null) {
      // askreply = new List<Null>();
      // json['askreply'].forEach((v) {
      //   askreply.add(new Null.fromJson(v));
      // });
    }
    if (json['notifications_done'] != null) {
      // notificationsDone = new List<Null>();
      // json['notifications_done'].forEach((v) {
      //   notificationsDone.add(new Null.fromJson(v));
      // });
      notificationsDone = json['notifications_done'].cast<String>();
    }
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
    data['uid'] = this.uid;
    data['cid'] = this.cid;
    data['uname'] = this.uname;
    data['homework_undone'] = this.homeworkUndone;
    if (this.homeworkreply != null) {
      // data['homeworkreply'] =
      //     this.homeworkreply.map((v) => v.toJson()).toList();
    }
    if (this.askreply != null) {
      // data['askreply'] = this.askreply.map((v) => v.toJson()).toList();
    }
    if (this.notificationsDone != null) {
      // data['notifications_done'] =
      //     this.notificationsDone.map((v) => v.toJson()).toList();
    }
    data['notifications_done'] = this.notificationsDone;

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
  bool isRead=false;

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
