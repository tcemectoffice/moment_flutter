import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:moment/components/common/circle_image.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/models/constants.dart' as constants;
import 'package:moment/providers/moment_new_post_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/components/moment/addpostcard.dart';

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
              // padding:
              //     const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              // margin: constants.getScreenMargin(context),
              child: SingleChildScrollView(
                child: const AddPostCard(
                  userName: "19F022 - Kishore L",
                  dpUrl:
                      "https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/*CustomScrollConfig(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                    IconData(0xf572,
                                        fontFamily: 'MaterialIcons',
                                        matchTextDirection: true),
                                  ),
                                ),
                                Text(
                                  "Add a Post",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return const AddPostCard(
                            userName: "19F022 - Kishore L",
                            dpUrl:
                                "https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=",
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                  ],
                ),
              ),
              */