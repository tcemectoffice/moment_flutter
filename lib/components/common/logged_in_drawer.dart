import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:flutter/material.dart';
import 'package:moment/utils/prefs.dart' as prefs;

class LoggedInDrawer extends StatefulWidget {
  const LoggedInDrawer({Key? key}) : super(key: key);

  @override
  LoggedInDrawerState createState() => LoggedInDrawerState();
}

class LoggedInDrawerState extends State<LoggedInDrawer> {
  bool isLoading = true;
  String userName = '';
  String userEmail = '';
  String userDp = '';

  initialize() async {
    setState(() {
      isLoading = true;
    });
    userName = await prefs.getString('userName');
    userEmail = await prefs.getString('userEmail');
    userDp = await prefs.getString('userDp');
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
    return isLoading
        ? const Drawer()
        : Drawer(
            child: CustomScrollConfig(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            UserAccountsDrawerHeader(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              accountName: Text(
                                userName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              accountEmail: Text(
                                userEmail,
                                style: const TextStyle(color: Colors.black),
                              ),
                              currentAccountPicture: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: serverImageProvider(userDp),
                              ),
                            ),
                            // Consumer<ThemeNotifier>(builder:
                            //     (BuildContext context, themeState, Widget? child) {
                            //   return ListTile(
                            //     leading: Icon(
                            //       Icons.wb_sunny,
                            //       color: Theme.of(context).iconTheme.color,
                            //     ),
                            //     onTap: () async {
                            //       themeState.toggleTheme();
                            //     },
                            //     title: Text(themeState.isDark!
                            //         ? 'Light Theme'
                            //         : 'Dark Theme'),
                            //   );
                            // }),
                            ListTile(
                              leading: Icon(
                                Icons.exit_to_app,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              onTap: () async {
                                await utils.logout(context);
                              },
                              title: const Text('Logout'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
