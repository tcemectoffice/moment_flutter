class LoginModel {
  int? status;
  int? userid;
  int? usertype;

  LoginModel({this.status, this.userid, this.usertype});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    userid = json['userid'];
    usertype = json['usertype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Status'] = status;
    data['userid'] = userid;
    data['usertype'] = usertype;
    return data;
  }
}
