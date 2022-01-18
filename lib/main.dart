import 'package:moment/constants.dart' as constants;
import 'package:moment/providers/home_page_provider.dart';
import 'package:moment/providers/moment_new_post_provider.dart';
import 'package:moment/providers/theme_provider.dart';
import 'package:moment/screens/base/home_screen.dart';
import 'package:moment/screens/base/login_screen.dart';
import 'package:moment/screens/base/notifications_screen.dart';
import 'package:moment/screens/base/splash_screen.dart';
import 'package:moment/screens/moment/add_post_screen.dart';
import 'package:moment/screens/moment/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => HomePageNotifier()),
        ChangeNotifierProvider(create: (context) => NewPostNotifier()),
      ],
      child: const Moment(),
    ),
  );
}

class Moment extends StatefulWidget {
  const Moment({Key? key}) : super(key: key);

  @override
  MomentState createState() => MomentState();
}

class MomentState extends State<Moment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ThemeNotifier>(context, listen: false).getCurrentTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, appState, child) {
      return MaterialApp(
        title: 'Moment',
        color: Colors.blueGrey,
        debugShowCheckedModeBanner: false,
        routes: {
          '/splash': (context) {
            return const SplashScreen();
          },
          '/login': (context) {
            return const LoginScreen();
          },
          '/home': (context) {
            return const HomeScreen();
          },
          '/add-post': (context) {
            return const AddPost();
          },
          '/profile': (context) {
            return Profile();
          },
          '/notifications': (context) {
            return const Notifications();
          },
        },
        theme: constants.lightTheme,
        darkTheme: constants.darkTheme,
        themeMode: appState.currentTheme,
        initialRoute: '/home',
        // initialRoute: '/splash',
      );
    });
  }
}
