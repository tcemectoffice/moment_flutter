class Group {
  late int groupid;
  late String groupname;
  late String groupdp;

  Group(
      {required this.groupid, required this.groupname, required this.groupdp});

  Group.fromJson(Map<String, dynamic> json) {
    try {
      groupid = json['groupid'];
      groupname = json['groupname'];
      groupdp = json['groupdp'];
    } catch (e) {
      print('GroupError: ' + e.toString());
    }
  }
}
