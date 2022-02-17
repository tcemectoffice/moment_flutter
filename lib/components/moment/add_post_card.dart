import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/components/moment/private_staff_selection_popup.dart';

class AddPostCard extends StatefulWidget {
  final String userName;
  final String dpUrl;

  const AddPostCard({Key? key, required this.userName, required this.dpUrl})
      : super(key: key);

  @override
  State<AddPostCard> createState() => _AddPostCardState();
}

class _AddPostCardState extends State<AddPostCard> {
  IconData iconSelected = Icons.circle_sharp;
  IconData iconNotSelected = Icons.circle_outlined;
  bool privateListVisibility = false, firstAttempt = true;
  int postPrivacy = 0;
  List<int> selectedStaff = [];
  File? postAttachment, oldAttachment;

  void pickFiles() async {
    oldAttachment = postAttachment;
    FilePickerResult? filePicker = await FilePicker.platform.pickFiles();
    if (filePicker != null && filePicker.files.first.path != null) {
      setState(() {
        postAttachment = File(filePicker.files.first.path!);
      });
      print(postAttachment!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: serverImage(widget.dpUrl),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const Text("Select a Group"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Post",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 17),
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          style: const TextStyle(fontSize: 14),
                          minLines: 4,
                          maxLines: 100,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: "Write Something here...",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: pickFiles,
                      child: DottedBorder(
                        padding: const EdgeInsets.all(10),
                        color: Colors.grey,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        dashPattern: const [5, 1],
                        child: postAttachment == null
                            ? Column(
                                children: [
                                  const Icon(Icons.image_search_rounded),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 10,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Icon(Icons.add),
                                        Expanded(
                                          child: Center(
                                            child: Text('Add Attachment'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text("File size must be less than 1mb"),
                                ],
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    width: 210,
                                    child: Card(
                                      elevation: 0,
                                      child: Text(postAttachment!.path),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: pickFiles,
                                      child: const Text('Change'))
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Post Visibility"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          privateListVisibility = false;
                          postPrivacy = 0;
                        });
                      },
                      child: Row(
                        children: [
                          Radio(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: 0,
                            groupValue: postPrivacy,
                            onChanged: (int? value) {
                              setState(
                                () {
                                  privateListVisibility = false;
                                  postPrivacy = 0;
                                  selectedStaff = [];
                                },
                              );
                            },
                          ),
                          const Text("Public"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        privateListVisibility = true;
                        postPrivacy = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: 1,
                          groupValue: postPrivacy,
                          onChanged: (int? value) async {
                            if (firstAttempt) {
                              var staffIds =
                                  await showStaffs(context, selectedStaff);
                              if (staffIds != null &&
                                  selectedStaff.isNotEmpty) {
                                setState(() {
                                  selectedStaff = staffIds;
                                });
                              } else {
                                return;
                              }
                            }
                            setState(
                              () {
                                firstAttempt = false;
                                privateListVisibility = true;
                                postPrivacy = 1;
                              },
                            );
                          },
                        ),
                        const Text("Private"),
                      ],
                    ),
                  ),
                ],
              ),
              if (privateListVisibility)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Visible to ${selectedStaff.length} people'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                          onPressed: () async {
                            var staffIds =
                                await showStaffs(context, selectedStaff);
                            if (staffIds != null && selectedStaff.isNotEmpty) {
                              setState(() {
                                selectedStaff = staffIds;
                              });
                            } else {
                              setState(() {
                                privateListVisibility = false;
                                postPrivacy = 0;
                              });
                            }
                          },
                          child: const Text('Add People')),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
