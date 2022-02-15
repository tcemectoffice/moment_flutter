class Filedetails {
  late int isimage;
  late String filesize;

  Filedetails({required this.isimage, required this.filesize});

  Filedetails.fromJson(Map<String, dynamic> json) {
    isimage = json['isimage'];
    filesize = json['filesize'];
  }
}
