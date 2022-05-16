import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/settings_options.dart';
import 'package:moment/components/moment/settings_profile.dart';
import 'package:moment/utils/prefs.dart' as prefs;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late final int userId, userType;
  late final String userName;
  late final String userDp;
  bool isLoading = true;

  initialize() async {
    setState(() {
      isLoading = true;
    });
    userId = int.parse((await prefs.getStringList('headers'))[0] ?? '0');
    userName = await prefs.getString('userName') ?? '';
    userDp = await prefs.getString('userDp') ?? '';
    userType = await prefs.getInt('userType') ?? 5;
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
        ? const Center(
            child: SizedBox(
              width: 120,
              child: LinearProgressIndicator(),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: CustomScrollConfig(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileCard(
                      userName: userName,
                      userDp: userDp,
                      userId: userId,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OptionsCard(userType: userType),
                  ),
                ],
              ),
            ),
          );
  }
}
