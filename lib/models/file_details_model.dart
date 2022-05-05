class Filedetails {
  late bool isimage;
  late String fileurl;
  late String filename;
  late String filesize;
  late String filetype;
  bool fileDownloaded = false;

  Filedetails(
      {required this.fileurl, required this.filesize, required this.filetype});

  Filedetails.fromJson(Map<String, dynamic> json) {
    try {
      isimage = json['isimage'] == 1;
      fileurl = json['fileurl'];
      filename = json['filename'];
      filesize = json['filesize'];
      filetype = json['filetype'];
    } catch (e) {
      print('FileDetailsError: ' + e.toString());
    }
  }
}
