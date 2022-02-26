class LoginModel {
  int? status;
  int? userid;
  int? usertype;

  LoginModel({this.status, this.userid, this.usertype});

  LoginModel.fromJson(Map<String, dynamic> json) {
    try {
      status = json['Status'];
      userid = json['userid'];
      usertype = json['usertype'];
    } catch (e) {
      print('LoginError: ' + e.toString());
    }
  }
}
