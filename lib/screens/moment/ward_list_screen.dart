import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/search_entity_card.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/screens/moment/profile_screen.dart';
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/services.dart' as services;

class WardListScreen extends StatefulWidget {
  const WardListScreen({Key? key}) : super(key: key);

  @override
  State<WardListScreen> createState() => _WardListScreenState();
}

class _WardListScreenState extends State<WardListScreen> {
  late List<dynamic> wardData = [];
  bool isLoading = true;

  Future<void> loadContent() async {
    setState(() {
      isLoading = true;
    });
    NetworkResponseModel responseData = await services.getWardList();
    switch (responseData.status) {
      case 4:
        if (responseData.data.isNotEmpty) {
          setState(() {
            wardData = responseData.data;
          });
        }
        break;
      case 999:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
        break;
      case 1000:
        utils.showSnackMessage(context, 'No Internet! Try again later!');
        break;
      default:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
    }
    setState(() {
      isLoading = false;
    });
    print(wardData.length);
  }

  @override
  void initState() {
    super.initState();
    loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Ward List"),
      ),
      body: isLoading
          ? const Center(
              child: SizedBox(width: 120, child: LinearProgressIndicator()),
            )
          : Container(
              margin: utils.getScreenMargins(context),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: RefreshIndicator(
                onRefresh: loadContent,
                child: CustomScrollConfig(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      if (wardData.isNotEmpty)
                        SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SearchEntityCard(
                                  name: wardData[index].name ?? '',
                                  regNo: wardData[index].regNo,
                                  dp: wardData[index].profilepic ?? '',
                                  onpressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Profile(
                                          userId: wardData[index].userid ?? 0,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                              ;
                            },
                            childCount: wardData.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
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
