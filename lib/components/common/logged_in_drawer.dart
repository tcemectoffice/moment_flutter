import 'package:moment/providers/theme_provider.dart';
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/models/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moment/providers/home_page_provider.dart';

class LoggedInDrawer extends StatefulWidget {
  const LoggedInDrawer({Key? key}) : super(key: key);

  @override
  LoggedInDrawerState createState() => LoggedInDrawerState();
}

class LoggedInDrawerState extends State<LoggedInDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      UserAccountsDrawerHeader(
                        decoration: const BoxDecoration(color: Colors.blueGrey),
                        accountName: const Text('Gomathi Sankar S M'),
                        accountEmail:
                            const Text('gomathisankar@student.tce.edu'),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset(constants.tceLogoAssetURL),
                        ),
                      ),
                      Consumer<ThemeNotifier>(builder:
                          (BuildContext context, themeState, Widget? child) {
                        return ListTile(
                          leading: Icon(
                            Icons.wb_sunny,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          onTap: () async {
                            themeState.toggleTheme();
                          },
                          title: Text(themeState.isDark!
                              ? 'Light Theme'
                              : 'Dark Theme'),
                        );
                      }),
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
