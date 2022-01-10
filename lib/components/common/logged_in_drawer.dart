import 'package:moment/constants.dart' as constants;
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
                      if (ModalRoute.of(context)!.settings.name != '/home' ||
                          Provider.of<HomePageNotifier>(context).index != 0)
                        ListTile(
                          onTap: () {
                            Provider.of<HomePageNotifier>(context,
                                    listen: false)
                                .setIndex(0);

                            if (ModalRoute.of(context)!.settings.name !=
                                '/home') {
                              Navigator.pushNamed(context, '/home');
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          title: const Text('Home'),
                        ),
                      if (ModalRoute.of(context)!.settings.name != '/profile')
                        ListTile(
                          onTap: () async {
                            Navigator.of(context).pushNamed('/profile');
                          },
                          title: const Text('Profile'),
                        ),
                      ListTile(
                        onTap: () {
                          // Navigator.of(context).pushNamed('/login');
                          print(Theme.of(context).primaryColor);
                        },
                        title: const Text('Logout'),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 4.0),
                    child: Column(
                      children: [
                        const Divider(
                          color: Colors.blueGrey,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Moment',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'BerkshireSwash',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Remote Monitoring App',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Version 0.1.0',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.blueGrey,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Developed by',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'BerkshireSwash',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 21.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Department of Mechatronics',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Thiagarajar College of Engineering',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Madurai - 625015',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Image.asset(
                        //     constants.tceLogoAssetURL,
                        //     height: 120.0,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
