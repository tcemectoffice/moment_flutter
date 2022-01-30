import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/models/constants.dart' as constants;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/screens/base/add_tutor_screen.dart';

class OptionsCard extends StatefulWidget {
  const OptionsCard({Key? key}) : super(key: key);

  @override
  _OptionsCardState createState() => _OptionsCardState();
}

class _OptionsCardState extends State<OptionsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Consumer<ThemeNotifier>(
                builder: (BuildContext context, appState, child) {
              return MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  appState.toggleTheme();
                },
                child: Container(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.wb_sunny)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                appState.isDark! ? 'Light Mode' : 'Dark Mode',
                                style: constants.settingsOptionStyle),
                          ),
                        ),
                        flex: 7,
                      ),
                    ],
                  ),
                ),
              );
            }),
            const Divider(),
            MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectTutorScreen()),
                );
                // showDialog(
                //   context: context,
                //   builder: (context) => CustomPopup(
                //     child: Center(
                //       child: CircularProgressIndicator(),
                //     ),
                //   ),
                // );
              },
              child: Container(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.person_add_alt)),
                      ),
                      flex: 4,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Add Tutor',
                            style: constants.settingsOptionStyle,
                          ),
                        ),
                      ),
                      flex: 7,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () async {
                await utils.logout(context);
              },
              child: Container(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.exit_to_app)),
                      ),
                      flex: 4,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Log out',
                            style: constants.settingsOptionStyle,
                          ),
                        ),
                      ),
                      flex: 7,
                    ),
                  ],
                ),
              ),
            ),
            // Divider(),
          ],
        ),
      ),
    );
  }
}
