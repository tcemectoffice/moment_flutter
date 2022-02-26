class Filedetails {
  late String fileurl;
  late String filesize;
  late String fileextension;

  Filedetails(
      {required this.fileurl,
      required this.filesize,
      required this.fileextension});

  Filedetails.fromJson(Map<String, dynamic> json) {
    try {
      fileurl = json['fileurl'];
      filesize = json['filesize'];
      fileextension = json['fileextension'];
    } catch (e) {
      print('FileDetailsError: ' + e.toString());
    }
  }
}
