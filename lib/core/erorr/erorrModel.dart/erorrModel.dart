class ErorrModel {
  int? stutusCode;
  dynamic response;

  ErorrModel({this.stutusCode, this.response});

  ErorrModel.fromJson(Map<String, dynamic> json) {
    stutusCode = json['stutusCode'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stutusCode'] = this.stutusCode;
    data['response'] = this.response;
    return data;
  }
}
