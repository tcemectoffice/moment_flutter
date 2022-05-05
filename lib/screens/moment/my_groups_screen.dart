import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/group_card.dart';
import 'package:moment/models/group_model.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:moment/screens/moment/groups_screen.dart';
import 'package:provider/provider.dart';

class MyGroups extends StatefulWidget {
  const MyGroups({Key? key}) : super(key: key);

  @override
  State<MyGroups> createState() => _MyGroupsState();
}

class _MyGroupsState extends State<MyGroups> {
  late List<Group> groups;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    groups = Provider.of<MomentHomeNotifier>(context, listen: false)
            .momentHomeData
            ?.group ??
        [];
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollConfig(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
          ),
          children: groups
              .map<Widget>(
                (group) => Container(
                  width: 200,
                  padding: const EdgeInsets.all(8.0),
                  child: GroupCard(
                    group: group,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Groups(groupId: group.groupid),
                        ),
                      );
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
