import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moment/components/common/bottom_navbar.dart';
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/components/common/logged_in_drawer.dart';
import 'package:moment/components/common/moment_appbar.dart';
import 'package:moment/screens/moment/add_post_screen.dart';
import 'package:moment/screens/moment/my_groups_screen.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/providers/home_page_provider.dart';
import 'package:moment/screens/moment/moment_home_screen.dart';
import 'package:moment/screens/moment/search_screen.dart';
import 'package:moment/screens/moment/settings_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = const [
    MomentHome(),
    MyGroups(),
    Search(),
    Settings(),
  ];

  Future<bool> onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to Exit the App?'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: const Text('Yes'),
              ),
              MaterialButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              MaterialButton(
                onPressed: () async {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => const CustomPopup(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                  if (await services.logout()) {
                    Provider.of<HomePageNotifier>(context, listen: false)
                        .setIndex(0, context);
                    Navigator.of(context).pop(false);
                    Navigator.of(context).pushNamed('/login');
                  } else {
                    utils.showSnackMessage(context, 'Please try again later!');
                  }
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageNotifier>(
      builder: (BuildContext context, homePageState, child) {
        return SafeArea(
          child: Scaffold(
            appBar: homePageState.isContentLoaded ? const MomentAppBar() : null,
            drawer:
                homePageState.isContentLoaded ? const LoggedInDrawer() : null,
            bottomNavigationBar:
                homePageState.isContentLoaded ? const BottomNavBar() : null,
            floatingActionButton: homePageState.isContentLoaded
                ? homePageState.index < 1
                    ? FloatingActionButton(
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {
                          if (homePageState.index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const AddPost()),
                              ),
                            );
                            return;
                          }
                        },
                      )
                    : null
                : null,
            body: WillPopScope(
              onWillPop: onWillPop,
              child: Container(
                margin: utils.getScreenMargins(context),
                child: screens[homePageState.index],
              ),
            ),
          ),
        );
      },
    );
  }
}
