import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/settings_options.dart';
import 'package:moment/components/moment/settings_profile.dart';
import 'package:moment/constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: CustomScrollConfig(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ProfileCard(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: OptionsCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
