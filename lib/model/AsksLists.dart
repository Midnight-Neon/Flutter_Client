class AskListReply {
  int code;
  List<Data> data;

  AskListReply({this.code, this.data});

  AskListReply.fromJson(Map<String, dynamic> json) {
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
  String owner;
  List<Reply> reply;
  int treply;
  int role;
  String content;
  String cid;
  String uid;

  Data(
      {this.sId,
        this.title,
        this.owner,
        this.reply,
        this.treply,
        this.role,
        this.content,
        this.cid,
        this.uid,
        });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    owner = json['owner'];
    if (json['reply'] != null) {
      reply = new List<Reply>();
      json['reply'].forEach((v) {
        reply.add(new Reply.fromJson(v));
      });
    }
    treply = json['treply'];
    role = json['role'];
    content = json['content'];
    cid = json['cid'];
    uid = json['uid'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['owner'] = this.owner;
    if (this.reply != null) {
      data['reply'] = this.reply.map((v) => v.toJson()).toList();
    }
    data['treply'] = this.treply;
    data['role'] = this.role;
    data['content'] = this.content;
    data['cid'] = this.cid;
    data['uid'] = this.uid;

    return data;
  }
}

class Reply {
  String owner;
  List<Reply> replys;
  // int reply;
  String content;
  String time;
  int role;

  Reply(
      {this.owner,
        this.replys,
        // this.reply,
        this.content,
        this.time,
        this.role});

  Reply.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    if (json['replys'] != null) {
      replys = new List<Reply>();
      json['replys'].forEach((v) {
        replys.add(new Reply.fromJson(v));
      });
    }
    // reply = json['reply'];
    content = json['content'];
    time = json['time'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['owner'] = this.owner;
    if (this.replys != null) {
      data['replys'] = this.replys.map((v) => v.toJson()).toList();
    }
    // data['reply'] = this.reply;
    data['content'] = this.content;
    data['time'] = this.time;
    data['role'] = this.role;
    return data;
  }
}

// class Replys {
//   String owner;
//   List<Replys> replys;
//   String reply;
//   String content;
//   String time;
//   int role;
//
//   Replys(
//       {this.owner,
//         this.replys,
//         this.reply,
//         this.content,
//         this.time,
//         this.role});
//
//   Replys.fromJson(Map<String, dynamic> json) {
//     owner = json['owner'];
//     if (json['replys'] != null) {
//       replys = new List<Replys>();
//       json['replys'].forEach((v) {
//         replys.add(new Replys.fromJson(v));
//       });
//     }
//     reply = json['reply'];
//     content = json['content'];
//     time = json['time'];
//     role = json['role'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['owner'] = this.owner;
//     if (this.replys != null) {
//       data['replys'] = this.replys.map((v) => v.toJson()).toList();
//     }
//     data['reply'] = this.reply;
//     data['content'] = this.content;
//     data['time'] = this.time;
//     data['role'] = this.role;
//     return data;
//   }
// }

// class Replys {
//   String owner;
//   List<Null> replys;
//   int reply;
//   String content;
//   String time;
//   int role;
//
//   Replys(
//       {this.owner,
//         this.replys,
//         this.reply,
//         this.content,
//         this.time,
//         this.role});
//
//   Replys.fromJson(Map<String, dynamic> json) {
//     owner = json['owner'];
//     if (json['replys'] != null) {
//       replys = new List<Null>();
//       json['replys'].forEach((v) {
//         replys.add(new Null.fromJson(v));
//       });
//     }
//     reply = json['reply'];
//     content = json['content'];
//     time = json['time'];
//     role = json['role'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['owner'] = this.owner;
//     if (this.replys != null) {
//       data['replys'] = this.replys.map((v) => v.toJson()).toList();
//     }
//     data['reply'] = this.reply;
//     data['content'] = this.content;
//     data['time'] = this.time;
//     data['role'] = this.role;
//     return data;
//   }
// }
