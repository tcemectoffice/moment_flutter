import 'package:flutter/material.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/models/user_model.dart';

class StaffRowTile extends StatefulWidget {
  final User staffDetails;
  final Widget trailing;

  const StaffRowTile({
    Key? key,
    required this.staffDetails,
    required this.trailing,
  }) : super(key: key);

  @override
  _StaffRowTileState createState() => _StaffRowTileState();
}

class _StaffRowTileState extends State<StaffRowTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: serverImageProvider(widget.staffDetails.profilepic)),
      title: Text(widget.staffDetails.name),
      subtitle: widget.staffDetails.designation != null
          ? Text(widget.staffDetails.designation!)
          : null,
      trailing: widget.trailing,
    );
  }
}
