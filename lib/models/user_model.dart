class User {
  int? userid;
  late String name;
  String? regNo;
  String? designation;
  late String profilepic;
  String? altemail;

  User(
      {required this.name,
      this.userid,
      this.regNo,
      this.designation,
      required this.profilepic,
      this.altemail});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userid = json['userid'];
    regNo = json['reg_no'];
    profilepic = json['profilepic'];
    designation = json['designation'];
    altemail = json['altemail'];
  }
}
