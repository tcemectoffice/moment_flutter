import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:moment/components/moment/add_post_card.dart';
import 'package:moment/utils/util_functions.dart' as utils;

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late String userName, userDp;
  bool isLoading = true;

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

  initialize() async {
    setState(() {
      isLoading = true;
    });
    userName = Provider.of<MomentHomeNotifier>(context, listen: false)
        .momentHomeData!
        .username;
    userDp = Provider.of<MomentHomeNotifier>(context, listen: false)
        .momentHomeData!
        .userdp;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 2,
          leadingWidth: 27,
          title: const Text(
            'Add Post',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
          margin: utils.getScreenMargins(context),
          child: isLoading
              ? const Center(
                  child: SizedBox(width: 120, child: LinearProgressIndicator()),
                )
              : AddPostCard(
                  userName: userName,
                  dpUrl: userDp,
                  primary: true,
                ),
        ),
      ),
    );
  }
}
