import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:moment/components/common/circle_image.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/models/constants.dart' as constants;
import 'package:moment/providers/moment_new_post_provider.dart';
import 'package:provider/provider.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  Future<bool> onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Discard the Post?'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  'Discard',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewPostNotifier>(
      builder: (BuildContext context, newPostState, child) {
        return WillPopScope(
          onWillPop: onWillPop,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Add Post'),
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
              margin: constants.getScreenMargin(context),
              child: CustomScrollConfig(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          CircleImage(
                            isAsset: true,
                            imgUrl: constants.tceLogoAssetURL,
                            radius: 45,
                            addPadding: false,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              'Gomathi Sankar S M',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, bottom: 12.0, left: 25.0),
                        child: Row(
                          children: [
                            const Text(
                              'Post to:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16.0),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton<int>(
                                  value: newPostState.targetId,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  alignment: Alignment.center,
                                  underline: null,
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text('MECT - General'),
                                      value: 7,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Tutor Ward'),
                                      value: 12,
                                    ),
                                  ],
                                  onChanged: (value) {
                                    newPostState.setTargetId(value!);
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 12.0),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: constants.textFormFieldEnabledBorder,
                            focusedBorder: constants.textFormFieldFocusedBorder,
                            errorBorder: constants.textFormFieldErrorBorder,
                          ),
                          maxLines: 7,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          var filePicker =
                              await FilePicker.platform.pickFiles();
                          newPostState
                              .uploadFile(filePicker!.files.first.path!);
                          print(newPostState.postAttachment!.path);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.attach_file),
                              Text('Add Attachment'),
                            ],
                          ),
                        ),
                      ),
                      if (newPostState.postAttachment != null)
                        Text(newPostState.postAttachment!.path),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
