import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/components/moment/group_selection_popup.dart';
import 'package:moment/components/moment/private_staff_selection_popup.dart';
import 'package:moment/models/group_model.dart';
import 'package:moment/models/user_model.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/services.dart' as services;

class AddPostCard extends StatefulWidget {
  final String userName;
  final String dpUrl;
  final bool primary;
  final String? groupName;
  final int? groupId;

  const AddPostCard({
    Key? key,
    required this.userName,
    required this.dpUrl,
    required this.primary,
    this.groupId,
    this.groupName,
  }) : super(key: key);

  @override
  State<AddPostCard> createState() => _AddPostCardState();
}

class _AddPostCardState extends State<AddPostCard> {
  bool postPrivacy = false, firstAttempt = true;
  List<int> selectedStaff = [];
  late bool primary = widget.primary;
  late int selectedGrpId = widget.groupId ?? 1;
  late String selectedGrpName = widget.groupName ?? 'MECT-General';
  File? postAttachment, oldAttachment;
  final TextEditingController postDataController = TextEditingController();

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

  void setPrivate() async {
    if (selectedGrpId != 3) {
      var staffIds = await showStaffs(context, selectedStaff);
      if (staffIds != null && selectedStaff.isNotEmpty) {
        setState(() {
          selectedStaff = staffIds;
          postPrivacy = true;
        });
      } else {
        setState(() {
          postPrivacy = false;
        });
      }
    } else {
      User tutor = Provider.of<MomentHomeNotifier>(context, listen: false)
          .momentHomeData!
          .tutor!;
      selectedStaff = [tutor.userid!];
    }
  }

  void addPost() async {
    if (postDataController.text.isNotEmpty) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const CustomPopup(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );

      bool addPost = await services.addPost(selectedGrpId,
          postDataController.text, postPrivacy, selectedStaff, postAttachment);
      if (addPost) {
        postDataController.clear();
        postPrivacy = false;
        firstAttempt = true;
        selectedStaff = [];
        selectedGrpId = 1;
        selectedGrpName = 'MECT-General';
        postAttachment = null;
        oldAttachment = null;
        Navigator.of(context).pop();
      } else {
        utils.showSnackMessage(context, 'Something went wrong! Try again!');
      }
      Navigator.of(context).pop();
    } else {
      utils.showSnackMessage(context, 'Content cannot be empty!');
    }
  }

  @override
  void dispose() {
    super.dispose();
    postDataController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollConfig(
      child: ListView(
        primary: primary,
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10)),
              elevation: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  serverImageProvider(widget.dpUrl),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180,
                                    child: Text(
                                      widget.userName,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.zero),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: widget.groupId != null
                                        ? () {}
                                        : () async {
                                            Group? selectedGrp =
                                                await showGroups(
                                                    context, selectedGrpId);
                                            if (selectedGrp != null) {
                                              if (selectedGrp.groupid == 3) {
                                                User? tutor = Provider.of<
                                                            MomentHomeNotifier>(
                                                        context,
                                                        listen: false)
                                                    .momentHomeData!
                                                    .tutor;
                                                if (tutor == null) {
                                                  utils.showSnackMessage(
                                                      context,
                                                      'Add Tutor to post in Tutor Ward group');
                                                  return;
                                                }
                                              }
                                              setState(() {
                                                selectedGrpId =
                                                    selectedGrp.groupid;
                                                selectedGrpName =
                                                    selectedGrp.groupname;
                                                postPrivacy = false;
                                                selectedStaff = [];
                                              });
                                            }
                                          },
                                    child: Text(selectedGrpName),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.zero),
                          ),
                          onPressed: addPost,
                          child: const Text(
                            "Post",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          14, 8, 14, widget.groupId == null ? 27 : 8),
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 21, bottom: 14),
                            child: TextFormField(
                              controller: postDataController,
                              style: const TextStyle(fontSize: 14),
                              minLines: widget.groupId != null ? 5 : 8,
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
                          if (widget.groupId == null)
                            GestureDetector(
                              onTap: pickFiles,
                              child: DottedBorder(
                                padding: const EdgeInsets.all(10),
                                color: Colors.grey,
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(12),
                                dashPattern: const [5, 1],
                                child: postAttachment == null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              const Icon(
                                                  Icons.image_search_rounded),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 40,
                                                  vertical: 10,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: SizedBox(
                                                  width: 150,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons.add),
                                                      Expanded(
                                                        child: Center(
                                                          child: Text(
                                                              'Add Attachment'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Card(
                                            elevation: 0,
                                            child: Text(postAttachment!.path),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextButton(
                                                onPressed: pickFiles,
                                                child: const Text('Change'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    postAttachment = null;
                                                  });
                                                },
                                                child: const Text(
                                                  'Remove',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
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
                                postPrivacy = false;
                              });
                            },
                            child: Row(
                              children: [
                                Radio<bool>(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: false,
                                  groupValue: postPrivacy,
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        postPrivacy = false;
                                        selectedStaff = [];
                                        firstAttempt = true;
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
                          onTap: setPrivate,
                          child: Row(
                            children: [
                              Radio<bool>(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: true,
                                  groupValue: postPrivacy,
                                  onChanged: (bool? value) async {
                                    setPrivate();
                                  }),
                              const Text("Private"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (postPrivacy)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            selectedGrpId != 3
                                ? Text(
                                    'Visible to ${selectedStaff.length} people')
                                : const Text('Visible only to your Tutor'),
                            if (selectedGrpId != 3)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextButton(
                                    style: ButtonStyle(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.zero),
                                    ),
                                    onPressed: () async {
                                      var staffIds = await showStaffs(
                                          context, selectedStaff);
                                      if (staffIds != null &&
                                          selectedStaff.isNotEmpty) {
                                        setState(() {
                                          selectedStaff = staffIds;
                                        });
                                      } else {
                                        setState(() {
                                          postPrivacy = false;
                                        });
                                      }
                                    },
                                    child: const Text('Add People')),
                              ),
                          ],
                        ),
                      ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
