import 'package:flutter/material.dart';

class AddPostInGrpsPage extends StatefulWidget {
  final String userName;
  final String dpUrl;
  const AddPostInGrpsPage({
    Key? key,
    required this.userName,
    required this.dpUrl,
  }) : super(key: key);

  @override
  State<AddPostInGrpsPage> createState() => _AddPostInGrpsPageState();
}

class _AddPostInGrpsPageState extends State<AddPostInGrpsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage(widget.dpUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userName,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Text("Select a Group"),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(),
                      flex: 2,
                    ),
                    Text(
                      "Post",
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 17),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: TextFormField(
                          minLines: 3,
                          maxLines: 100,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: "Write Something here...",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.filter,
                                color: Colors.grey,
                                size: 30,
                              ),
                              Text("Image"),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.file_present,
                                color: Colors.grey,
                                size: 30,
                              ),
                              Text("File"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
