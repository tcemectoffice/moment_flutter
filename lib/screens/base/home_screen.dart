import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moment/components/common/bottom_navbar.dart';
import 'package:moment/components/common/logged_in_drawer.dart';
import 'package:moment/models/constants.dart' as constants;
import 'package:moment/providers/home_page_provider.dart';
import 'package:moment/screens/mctea/mctea_home_screen.dart';
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
    McteaHome(),
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
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              MaterialButton(
                onPressed: () => exit(0),
                child: const Text('Yes'),
              ),
              MaterialButton(
                onPressed: () => Navigator.of(context).pop(false),
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
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Moment'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                  icon: const Icon(
                    Icons.notifications_outlined,
                  ))
            ],
          ),
          drawer: const LoggedInDrawer(),
          bottomNavigationBar: BottomNavBar(
            index: homePageState.index,
            onTap: homePageState.setIndex,
          ),
          floatingActionButton: homePageState.index < 1
              ? FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    switch (homePageState.index) {
                      case 0:
                        {
                          Navigator.pushNamed(context, '/add-post');
                          return;
                        }
                      case 1:
                        {
                          Navigator.pushNamed(context, '/add-event');
                          return;
                        }
                      default:
                        {
                          return;
                        }
                    }
                  },
                )
              : null,
          body: WillPopScope(
            onWillPop: onWillPop,
            child: Container(
              margin: constants.getScreenMargin(context),
              child: screens[homePageState.index],
            ),
          ),
        );
      },
    );
  }
}
