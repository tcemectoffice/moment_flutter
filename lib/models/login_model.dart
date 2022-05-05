class LoginModel {
  int? status;
  int? userid;
  int? usertype;
  String? username;
  String? useremail;
  String? userdp;

  LoginModel(
      {this.status,
      this.userid,
      this.usertype,
      this.username,
      this.useremail,
      this.userdp});

  LoginModel.fromJson(Map<String, dynamic> json) {
    try {
      status = json['Status'];
      userid = json['userid'];
      usertype = json['usertype'];
      username = json['username'];
      useremail = json['useremail'];
      userdp = json['userdp'];
    } catch (e) {
      print('LoginError: ' + e.toString());
    }
  }
}
