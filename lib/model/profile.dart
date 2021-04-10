
class LoginResp {
  int code;
  Profile data;

  LoginResp({this.code, this.data});

  LoginResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Profile.fromJson(json['data']) : null;
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

class Profile {
  String iD;
  String name;
  int role;
  String refreshToken;
  String accessToken;

  Profile({this.iD, this.name, this.role, this.refreshToken, this.accessToken});

  Profile.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    role = json['role'].toInt();
    refreshToken = json['refresh_token'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['name'] = this.name;
    data['role'] = this.role;
    data['refresh_token'] = this.refreshToken;
    data['access_token'] = this.accessToken;
    return data;
  }
}