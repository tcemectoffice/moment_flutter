class Group {
  late String groupname;
  late String groupdp;

  Group({required this.groupname, required this.groupdp});

  Group.fromJson(Map<String, dynamic> json) {
    groupname = json['groupname'];
    groupdp = json['groupdp'];
  }
}
