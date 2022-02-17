import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/models/user_model.dart';
import 'package:moment/providers/staff_provider.dart';
import 'package:provider/provider.dart';

showStaffs(BuildContext context, List<int> selectedStaff) {
  return showDialog(
    context: context,
    builder: (context) {
      List<int> selectedIds = selectedStaff;
      List<User> staffDetails =
          Provider.of<StaffNotifier>(context, listen: false).staffDetails!;
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          insetPadding:
              const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          titlePadding: const EdgeInsets.fromLTRB(18, 16, 16, 5),
          contentPadding: const EdgeInsets.symmetric(horizontal: 2.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Add People"),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    selectedIds,
                  );
                },
                child: const Text("Done"),
              ),
            ],
          ),
          content: CustomScrollConfig(
            child: SingleChildScrollView(
                child: Column(
              children: staffDetails.map((staff) {
                return StaffRowTile(
                  staffDetails: staff,
                  trailing: Checkbox(
                    value: selectedIds.contains(staff.userid),
                    onChanged: (bool? val) {
                      if (val!) {
                        setState(() {
                          selectedIds.add(staff.userid!);
                        });
                      } else {
                        setState(() {
                          selectedIds.remove(staff.userid!);
                        });
                      }
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

class StaffRowTile extends StatefulWidget {
  final User staffDetails;
  final Widget trailing;
  // final bool isPopUp;

  const StaffRowTile({
    Key? key,
    required this.staffDetails,
    required this.trailing,
    // required this.isPopUp,
  }) : super(key: key);

  @override
  _StaffRowTileState createState() => _StaffRowTileState();
}

class _StaffRowTileState extends State<StaffRowTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: serverImage(widget.staffDetails.profilepic)),
      title: Text(widget.staffDetails.name),
      subtitle: Text(widget.staffDetails.designation!),
      trailing: widget.trailing,
    );
  }
}
