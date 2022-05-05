import 'package:flutter/material.dart';
import 'package:moment/components/common/bottom_navbar.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/logged_in_drawer.dart';
import 'package:moment/components/common/moment_appbar.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/models/user_model.dart';
import 'package:moment/screens/moment/edit_profile_screen.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/utils/prefs.dart' as prefs;
import 'package:url_launcher/url_launcher_string.dart';

class Profile extends StatefulWidget {
  final int userId;
  const Profile({Key? key, required this.userId}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late int userId;
  late User user;
  late bool isEditable;
  bool isLoading = true;
  final GlobalKey<ScaffoldState> profileScaffold = GlobalKey<ScaffoldState>();

  Future<void> initialize() async {
    setState(() {
      isLoading = true;
    });
    int currentUser =
        int.parse((await prefs.getStringList('headers'))[0] ?? '0');
    NetworkResponseModel responseData = await services.userProfile(userId);
    switch (responseData.status) {
      case 5:
        bool sameUser = responseData.data.userid == currentUser;
        setState(() {
          user = responseData.data;
          isEditable = sameUser;
        });
        break;
      case 999:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
        break;
      case 1000:
        utils.showSnackMessage(context, 'No Internet! Try again later!');
        break;
      default:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    userId = widget.userId;
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: profileScaffold,
        appBar: const MomentAppBar(),
        bottomNavigationBar: const BottomNavBar(index: 1),
        drawer: const LoggedInDrawer(),
        body: Center(
          child: RefreshIndicator(
            onRefresh: initialize,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 15, top: 35, right: 12, bottom: 20),
                  child: CustomScrollConfig(
                    child: ListView(
                      shrinkWrap: true,
                      children: isLoading
                          ? const [
                              SizedBox(
                                height: 300,
                                child: Center(
                                  child: SizedBox(
                                    width: 120,
                                    child: LinearProgressIndicator(),
                                  ),
                                ),
                              ),
                            ]
                          : [
                              Container(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  radius: 75,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      serverImageProvider(user.profilepic),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  user.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              isEditable
                                  ? Container(
                                      alignment: Alignment.center,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  EditProfile(
                                                    name: user.name,
                                                    email: user.altemail ?? '',
                                                    regNum: user.regNo ?? '',
                                                    phone:
                                                        user.usermobile ?? '',
                                                    dp: user.profilepic,
                                                  )),
                                            ),
                                          );
                                        },
                                        child: const Text('Edit Profile'),
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 15,
                                    ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: const Divider(
                                  thickness: 2,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text('Email: ${user.useremail}'),
                                    ),
                                    if (user.tutorname != 'Not updated')
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text('Tutor: ${user.tutorname}'),
                                      ),
                                  ],
                                ),
                              ),
                              if (!isEditable && user.usermobile != null)
                                if (user.usermobile!.isNotEmpty)
                                  Center(
                                    child: Container(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          launchUrlString(
                                              'tel:${user.usermobile}');
                                        },
                                        child: const Text('Call'),
                                      ),
                                    ),
                                  )
                            ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
