import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
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
  bool isSelected = true;
  IconData iconSelected = Icons.circle_sharp;
  IconData iconNotSelected = Icons.circle_outlined;
  int radioButton1Value = 0;
  int radioButton2Value = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
        elevation: 8,
        child: Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: NetworkImage(widget.dpUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userName,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("Select a Group"),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(),
                      flex: 2,
                    ),
                    Text(
                      "Post",
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 17),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: TextFormField(
                          minLines: 4,
                          maxLines: 100,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: "Write Something here...",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      DottedBorder(
                        padding: EdgeInsets.all(10),
                        color: Colors.grey,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        dashPattern: [6, 1],
                        child: Column(
                          children: [
                            Icon(Icons.image_search_rounded),
                            GestureDetector(
                              onTap: () async {
                                // FilePickerResult? filePicker =
                                //     await FilePicker.platform.pickFiles();
                                // newPostState
                                //     .uploadFile(filePicker!.files.first.path!);
                                // print(newPostState.postAttachment!.path);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 10,
                                ),
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                            ),
                            // Text("File size must be less than 1mb"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Post Visibility"),
                    GestureDetector(
                      onTap: () {
                        null;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: radioButton1Value,
                              onChanged: (value) {
                                setState(
                                  () {
                                    radioButton1Value = 1;
                                    radioButton2Value = 0;
                                  },
                                );
                              },
                            ),
                            Text(
                              "Public",
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        null;
                      },
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: radioButton2Value,
                            onChanged: (value) {
                              setState(
                                () {
                                  radioButton1Value = 0;
                                  radioButton2Value = 1;
                                  showStaffs(context);
                                },
                              );
                            },
                          ),
                          Text(
                            "Private",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
