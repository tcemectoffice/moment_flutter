class SearchEntityModel {
  int? userid;
  int? groupid;
  String? name;
  String? groupname;
  String? groupdp;
  String? profilepic;
  late bool isUser;

  SearchEntityModel({
    this.name,
    this.groupname,
    this.userid,
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
      groupid = json['groupid'];
      profilepic = json['profilepic'];
      groupdp = json['groupdp'];
      isUser = json['isUser'] == 1;
    } catch (e) {
      print('SearchEntityError: ' + e.toString());
    }
  }
}
