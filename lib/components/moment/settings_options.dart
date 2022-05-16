import 'package:flutter/material.dart';
import 'package:moment/models/constants.dart' as constants;
// import 'package:moment/providers/home_page_provider.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:moment/screens/base/change_password_screen.dart';
import 'package:moment/screens/moment/profile_screen.dart';
import 'package:moment/screens/moment/ward_list_screen.dart';
// import 'package:moment/screens/moment/my_groups_screen.dart';
import 'package:moment/utils/util_functions.dart' as utils;
// import 'package:moment/providers/app_state_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/screens/base/add_tutor_screen.dart';

class OptionsCard extends StatefulWidget {
  final int userType;
  const OptionsCard({Key? key, required this.userType}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            // Consumer<ThemeNotifier>(
            //     builder: (BuildContext context, appState, child) {
            //   return MaterialButton(
            //     splashColor: Colors.transparent,
            //     highlightColor: Colors.transparent,
            //     onPressed: () {
            //       appState.toggleTheme();
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.all(14.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: const [
            //           // Expanded(
            //           //   flex: 4,
            //           //   child: Padding(
            //           //     padding: EdgeInsets.symmetric(horizontal: 15.0),
            //           //     child: Align(
            //           //         alignment: Alignment.centerRight,
            //           //         child: Icon(Icons.wb_sunny)),
            //           //   ),
            //           // ),
            //           // Expanded(
            //           //   child: Padding(
            //           //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //           //     child: Align(
            //           //       alignment: Alignment.centerLeft,
            //           //       child: Text(
            //           //           appState.isDark!
            //           //               ? 'Light Mode'
            //           //               : 'Dark Mode (beta)',
            //           //           style: constants.settingsOptionStyle),
            //           //     ),
            //           //   ),
            //           //   flex: 7,
            //           // ),
            //         ],
            //       ),
            //     ),
            //   );
            // }),
            // const Divider(),
            // MaterialButton(
            //   splashColor: Colors.transparent,
            //   highlightColor: Colors.transparent,
            //   onPressed: () {
            //     Provider.of<HomePageNotifier>(context, listen: false)
            //         .setIndex(1, context);
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.all(14.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: const [
            //         Expanded(
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 15.0),
            //             child: Align(
            //                 alignment: Alignment.centerRight,
            //                 child: Icon(Icons.group)),
            //           ),
            //           flex: 4,
            //         ),
            //         Expanded(
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 15.0),
            //             child: Align(
            //               alignment: Alignment.centerLeft,
            //               child: Text(
            //                 'My Groups',
            //                 style: constants.settingsOptionStyle,
            //               ),
            //             ),
            //           ),
            //           flex: 7,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const Divider(),
            if (widget.userType == 1 || widget.userType == 2)
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WardListScreen()),
                  );
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
                              child: Icon(Icons.person_pin_outlined)),
                        ),
                        flex: 4,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Ward List',
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
            if (widget.userType != 1 && widget.userType != 2)
              Consumer<MomentHomeNotifier>(
                  builder: (BuildContext context, tutorState, Widget? child) {
                return tutorState.momentHomeData!.tutor == null
                    ? MaterialButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddTutorScreen()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.person_add)),
                                ),
                                flex: 4,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
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
                      )
                    : MaterialButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(
                                      userId: tutorState
                                          .momentHomeData!.tutor!.userid!,
                                    )),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.person)),
                                ),
                                flex: 4,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Tutor Info',
                                      style: constants.settingsOptionStyle,
                                    ),
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
                  MaterialPageRoute(
                      builder: (context) => const ChangePassword()),
                );
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
                            child: Icon(Icons.lock_outline)),
                      ),
                      flex: 4,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Change Password',
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
