class SearchEntityModel {
  int? userid;
  int? groupid;
  String? name;
  String? regNo;
  String? groupname;
  String? groupdp;
  String? profilepic;
  late bool isUser;

  SearchEntityModel({
    this.name,
    this.groupname,
    this.userid,
    this.regNo,
    this.groupid,
    this.groupdp,
    this.profilepic,
    required this.isUser,
  });

  SearchEntityModel.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      groupname = json['groupname'];
      userid = json['userid'];
      regNo = json['reg_no'];
      groupid = json['groupid'];
      profilepic = json['profilepic'];
      groupdp = json['groupdp'];
      isUser = json['isUser'] == 1;
    } catch (e) {
      print('SearchEntityError: ' + e.toString());
    }
  }
}
