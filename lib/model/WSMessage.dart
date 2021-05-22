class WSMessage {
  int sender;
  int type;
  String data;
  List<int> score;

  WSMessage({this.sender, this.type, this.data, this.score});

  WSMessage.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    type = json['type'];
    data = json['data'];
    score = json['score']!=null?json['score'].cast<int>():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['type'] = this.type;
    data['data'] = this.data;
    data['score'] = this.score;
    return data;
  }
}
