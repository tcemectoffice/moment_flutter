import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/models/group_model.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:provider/provider.dart';

showGroups(BuildContext context, int selectedgroupId) {
  return showDialog(
    context: context,
    builder: (context) {
      List<Group> groups =
          Provider.of<MomentHomeNotifier>(context, listen: false)
              .momentHomeData!
              .group;
      Group selectedGrp =
          groups.firstWhere((group) => group.groupid == selectedgroupId);
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          insetPadding:
              const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          titlePadding: const EdgeInsets.fromLTRB(18, 16, 16, 5),
          contentPadding:
              const EdgeInsets.only(left: 2.5, right: 2.5, bottom: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Select a Group"),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    selectedGrp,
                  );
                },
                child: const Text("Done"),
              ),
            ],
          ),
          content: CustomScrollConfig(
            child: SingleChildScrollView(
                child: Column(
              children: groups.map((group) {
                return GroupRowTile(
                  groupDetails: group,
                  trailing: Radio<int>(
                    value: group.groupid,
                    groupValue: selectedGrp.groupid,
                    onChanged: (int? value) {
                      setState(() {
                        selectedGrp = groups
                            .firstWhere((group) => group.groupid == value!);
                      });
                    },
                  ),
                );
              }).toList(),
            )),
          ),
        );
      });
    },
  );
}

class GroupRowTile extends StatefulWidget {
  final Group groupDetails;
  final Widget trailing;

  const GroupRowTile({
    Key? key,
    required this.groupDetails,
    required this.trailing,
  }) : super(key: key);

  @override
  _GroupRowTileState createState() => _GroupRowTileState();
}

class _GroupRowTileState extends State<GroupRowTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: serverImage(widget.groupDetails.groupdp)),
      title: Text(widget.groupDetails.groupname),
      trailing: widget.trailing,
    );
  }
}
