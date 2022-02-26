import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:moment/models/constants.dart' as constants;
import 'package:moment/providers/home_page_provider.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:moment/providers/theme_provider.dart';
import 'package:moment/screens/base/home_screen.dart';
import 'package:moment/screens/base/login_screen.dart';
import 'package:moment/screens/base/notifications_screen.dart';
import 'package:moment/screens/base/splash_screen.dart';
import 'package:moment/screens/moment/add_post_screen.dart';
import 'package:moment/screens/moment/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

late AndroidNotificationChannel channel;

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'fcm_channel',
      'FCM Notifications',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => HomePageNotifier()),
        ChangeNotifierProvider(create: (context) => MomentHomeNotifier()),
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
  Future<void> setupFCM() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    Navigator.pushNamed(navKey.currentState!.context, '/notifications');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ThemeNotifier>(context, listen: false).getCurrentTheme();
    });
    setupFCM();
    FirebaseMessaging.instance.subscribeToTopic('test');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, appState, child) {
      return MaterialApp(
        navigatorKey: navKey,
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
        initialRoute: '/splash',
        // initialRoute: '/login',
        // initialRoute: '/home',
      );
    });
  }
}
