import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/components/moment/staff_row_tile.dart';
import 'package:moment/models/user_model.dart';
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/providers/moment_home_provider.dart';

class AddTutorScreen extends StatefulWidget {
  const AddTutorScreen({Key? key}) : super(key: key);

  @override
  State<AddTutorScreen> createState() => _AddTutorScreenState();
}

class _AddTutorScreenState extends State<AddTutorScreen> {
  late List<User> staffList;
  int? selectedStaffId;

  confirmTutor() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const CustomPopup(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    if (selectedStaffId != null) {
      bool addTutor = await services.tutorSave(selectedStaffId!);
      if (addTutor) {
        Provider.of<MomentHomeNotifier>(context, listen: false)
            .setTutor(selectedStaffId!);
        Navigator.of(context).pop();
      } else {
        utils.showSnackMessage(context, 'Something went wrong! Try again!');
      }
    } else {
      utils.showSnackMessage(context, 'Select your tutor');
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    staffList = Provider.of<MomentHomeNotifier>(context, listen: false)
        .momentHomeData!
        .staffdetails;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: utils.getScreenMargins(context),
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                  ),
                                ),
                              ),
                              const Text(
                                "Add a Tutor",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: confirmTutor,
                        child: const Text(
                          "Done",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index == staffList.length) {
                      return const SizedBox(
                        height: 21,
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 4),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          child: StaffRowTile(
                            staffDetails: staffList[index],
                            trailing: Radio<int>(
                                value: staffList[index].userid!,
                                groupValue: selectedStaffId,
                                onChanged: (int? value) {
                                  setState(() {
                                    selectedStaffId = value;
                                  });
                                }),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: staffList.length + 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
