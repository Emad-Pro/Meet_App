// ignore_for_file: file_names

class AuthModel {
  String? username;
  String? uid;
  String? profilePhoto;

  AuthModel({this.username, this.uid, this.profilePhoto});

  AuthModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    uid = json['uid'];
    profilePhoto = json['profilePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['uid'] = uid;
    data['profilePhoto'] = profilePhoto;
    return data;
  }
}
