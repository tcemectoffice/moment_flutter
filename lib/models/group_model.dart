class Group {
  late String groupname;
  late String groupdp;

  Group({required this.groupname, required this.groupdp});

  Group.fromJson(Map<String, dynamic> json) {
    try {
      groupname = json['groupname'];
      groupdp = json['groupdp'];
    } catch (e) {
      print('GroupError: ' + e.toString());
    }
  }
}
