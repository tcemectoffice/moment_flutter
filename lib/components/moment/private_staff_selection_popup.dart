import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/staff_row_tile.dart';
import 'package:moment/models/user_model.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:provider/provider.dart';

showStaffs(BuildContext context, List<int> selectedStaff) {
  return showDialog(
    context: context,
    builder: (context) {
      List<int> selectedIds = selectedStaff;
      List<User> staffDetails =
          Provider.of<MomentHomeNotifier>(context, listen: false)
              .momentHomeData!
              .staffdetails;
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          insetPadding:
              const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          titlePadding: const EdgeInsets.fromLTRB(18, 16, 16, 5),
          contentPadding:
              const EdgeInsets.only(left: 2.5, right: 2.5, bottom: 15),
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
