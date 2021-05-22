class WordResp {
  int code;
  List<Word> data;

  WordResp({this.code, this.data});

  WordResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Word>();
      json['data'].forEach((v) {
        data.add(new Word.fromJson(v));
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

class Word {
  String word;
  String meaning;
  String type;
  String pron;

  Word({this.word, this.meaning, this.type, this.pron});

  Word.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    meaning = json['meaning'];
    type = json['type'];
    pron = json['pron'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    data['meaning'] = this.meaning;
    data['type'] = this.type;
    data['pron'] = this.pron;
    return data;
  }
}
