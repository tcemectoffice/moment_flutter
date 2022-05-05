import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:moment/providers/group_screen_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:moment/models/constants.dart' as constants;
import 'package:moment/utils/prefs.dart' as prefs;
import 'package:moment/providers/home_page_provider.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:moment/providers/app_state_provider.dart';
import 'package:moment/screens/base/home_screen.dart';
import 'package:moment/screens/base/login_screen.dart';
import 'package:moment/screens/base/notifications_screen.dart';
import 'package:moment/screens/base/splash_screen.dart';

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
        ChangeNotifierProvider(create: (context) => AppNotifier()),
        ChangeNotifierProvider(create: (context) => HomePageNotifier()),
        ChangeNotifierProvider(create: (context) => MomentHomeNotifier()),
        ChangeNotifierProvider(create: (context) => GroupScreenNotifier()),
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
    Navigator.push(
      navKey.currentState!.context,
      MaterialPageRoute(
        builder: ((context) => const Notifications()),
      ),
    );
  }

  setupLocalDocDir() async {
    var dir = await getTemporaryDirectory();
    prefs.setString('localDocPath', dir.path);
  }

  @override
  void initState() {
    super.initState();
    //TODO: Uncomment the following block when Dark Theme is completed
    // for system theme integration

    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   Provider.of<AppNotifier>(context, listen: false).getCurrentTheme();
    // });
    setupFCM();
    setupLocalDocDir();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(builder: (context, appState, child) {
      return MaterialApp(
        navigatorKey: navKey,
        locale: const Locale('en', 'IN'),
        title: 'Moment',
        color: const Color.fromARGB(255, 99, 192, 255),
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
        },
        theme: constants.lightTheme,
        darkTheme: constants.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: '/splash',
        // initialRoute: '/login',
        // initialRoute: '/home',
      );
    });
  }
}
