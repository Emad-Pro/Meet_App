class LoginAuthModel {
  String? username;
  String? uid;
  String? profilePhoto;

  LoginAuthModel({this.username, this.uid, this.profilePhoto});

  LoginAuthModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    uid = json['uid'];
    profilePhoto = json['profilePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['uid'] = this.uid;
    data['profilePhoto'] = this.profilePhoto;
    return data;
  }
}
