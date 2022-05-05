import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/search_entity_card.dart';
import 'package:moment/screens/moment/groups_screen.dart';
import 'package:moment/screens/moment/profile_screen.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  dynamic data;
  bool searchLoading = false;
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  searchEntities(String searchPhrase) async {
    searchNode.unfocus();
    setState(() {
      searchLoading = true;
    });
    if (searchPhrase.isNotEmpty) {
      dynamic searchResponse = await services.searchEntities(searchPhrase);
      switch (searchResponse.status) {
        case 4:
          setState(() {
            data = searchResponse.data;
          });
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
    }
    setState(() {
      searchLoading = false;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(top: 36),
      child: CustomScrollConfig(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      focusNode: searchNode,
                      autofocus: false,
                      controller: searchController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search_outlined),
                        fillColor: Colors.white,
                      ),
                      onFieldSubmitted: searchEntities,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                    child: Center(
                      child: SizedBox(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () async {
                            await searchEntities(searchController.text);
                          },
                          child: const Text('Search'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (searchLoading)
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: Center(
                      child: SizedBox(
                          width: 120, child: LinearProgressIndicator())),
                ),
              ),
            if (data != null && data.isNotEmpty && !searchLoading)
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return data[index].isUser
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SearchEntityCard(
                              name: data[index].name,
                              dp: data[index].profilepic,
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profile(
                                      userId: data[index].userid,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SearchEntityCard(
                              name: data[index].groupname,
                              dp: data[index].groupdp,
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Groups(groupId: data[index].groupid),
                                  ),
                                );
                              },
                            ),
                          );
                  },
                  childCount: data.length,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
