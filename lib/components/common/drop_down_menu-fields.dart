import 'package:flutter/material.dart';

class DropdownMenu extends StatefulWidget {
  final List<String> items;
  final String defVal;
  const DropdownMenu({
    Key? key,
    required this.items,
    required this.defVal,
  }) : super(key: key);

  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String dropDownVal = "";
  @override
  void initState() {
    dropDownVal = widget.defVal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Community : ",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              // color: const Color(0XFFF6F6F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                iconSize: 35,
                isExpanded: true,
                value: dropDownVal,
                items: widget.items.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 18),
                      ),
                      value: value,
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownVal = newValue!;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
