import 'package:flutter/material.dart';

showStaffs(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(vertical: 100),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Row(
            children: [
              Text("Add People"),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              TextButton(
                onPressed: () {
                  setState(
                    () {
                      Navigator.pop(context);
                    },
                  );
                },
                child: Text("Done"),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: const [
                StaffRowTile(
                  staffName: "Dr.G.Kanagaraj",
                  staffTitle: "Associate Professor",
                  isPopUp: true,
                ),
                StaffRowTile(
                  staffName: "Dr.G.Kumaraguruparan",
                  staffTitle: "Associate Professor",
                  isPopUp: true,
                ),
                StaffRowTile(
                  staffName: "Mr.S.Partha Sarathi",
                  staffTitle: "Assistant Professor",
                  isPopUp: true,
                ),
                StaffRowTile(
                  staffName: "Mr.S.Julius Fusic",
                  staffTitle: "Assistant Professor",
                  isPopUp: true,
                ),
                StaffRowTile(
                  staffName: "Mr.H.Ramesh",
                  staffTitle: "Assistant Professor",
                  isPopUp: true,
                ),
                StaffRowTile(
                  staffName: "Mr.M.A.Ramesh",
                  staffTitle: "Assistant Professor",
                  isPopUp: true,
                ),
                StaffRowTile(
                  staffName: "Mr.S.A.R.Sheik Mastan",
                  staffTitle: "Assistant Professor",
                  isPopUp: true,
                ),
                StaffRowTile(
                  staffName: "Mr.S.Manikandan",
                  staffTitle: "Assistant Professor",
                  isPopUp: true,
                ),
                StaffRowTile(
                  staffName: "Mr.M.M.Devarajan",
                  staffTitle: "Assistant Professor",
                  isPopUp: true,
                ),
                StaffRowTile(
                  staffName: "Mr.B.Praveen Kumar",
                  staffTitle: "Assistant Professor",
                  isPopUp: true,
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

class StaffRowTile extends StatefulWidget {
  final String staffName;
  final String staffTitle;
  final bool isPopUp;

  const StaffRowTile({
    Key? key,
    required this.staffName,
    required this.isPopUp,
    required this.staffTitle,
  }) : super(key: key);

  @override
  _StaffRowTileState createState() => _StaffRowTileState();
}

bool isChecked = false;
bool radioButtonValue = false;

class _StaffRowTileState extends State<StaffRowTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 27,
            backgroundImage: NetworkImage(""),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.staffName,
                    style:
                        !widget.isPopUp ? TextStyle(fontSize: 20) : TextStyle(),
                  ),
                  if (!widget.isPopUp)
                    Text(
                      widget.staffTitle,
                      style: TextStyle(fontSize: 17),
                    )
                ],
              ),
            ),
          ),
          widget.isPopUp
              ? Checkbox(
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(
                      () {
                        isChecked = newValue!;
                      },
                    );
                  },
                )
              : Radio(
                  value: 1,
                  groupValue: radioButtonValue,
                  onChanged: (value) {
                    setState(
                      () {
                        radioButtonValue = true;
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}
