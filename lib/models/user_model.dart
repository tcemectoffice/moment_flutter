class User {
  late String name;
  late String regNo;
  late String profilepic;
  late String altemail;

  User(
      {required this.name,
      required this.regNo,
      required this.profilepic,
      required this.altemail});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    regNo = json['reg_no'];
    profilepic = json['profilepic'];
    altemail = json['altemail'];
  }
}
