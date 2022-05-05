class User {
  int? userid;
  late String name;
  String? regNo;
  String? designation;
  late String profilepic;
  String? altemail;
  String? useremail;
  String? tutorname;
  String? usermobile;

  User({
    required this.name,
    this.userid,
    this.regNo,
    this.designation,
    required this.profilepic,
    this.altemail,
    this.useremail,
    this.tutorname,
    this.usermobile,
  });

  User.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      userid = json['userid'];
      regNo = json['reg_no'];
      profilepic = json['profilepic'];
      designation = json['designation'];
      altemail = json['altemail'];
      useremail = json['useremail'];
      tutorname = json['tutorname'];
      usermobile = json['usermobile'];
    } catch (e) {
      print('UserError: ' + e.toString());
    }
  }
}
