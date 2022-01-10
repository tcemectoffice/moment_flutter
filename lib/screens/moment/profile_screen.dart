import 'package:flutter/material.dart';
import 'package:moment/components/common/circle_image.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/logged_in_drawer.dart';
import 'package:moment/constants.dart';

class Profile extends StatelessWidget {
  final String name = 'Gomathi Sankar S M';
  final String regNum = '18F012';
  final String email = 'gomathisankar@student.tce.edu';
  final String year = 'IV';
  final String batch = '2018-2022';
  final String tutor = 'Prof. Ramesh H';
  final bool isEditable = true;

  final GlobalKey<ScaffoldState> profileScaffold = GlobalKey<ScaffoldState>();

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: profileScaffold,
      drawer: const LoggedInDrawer(),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 18,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () {
                            profileScaffold.currentState!.openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15, top: 35, right: 12, bottom: 20),
                    child: CustomScrollConfig(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: const CircleImage(
                                isAsset: true,
                                imgUrl: appLogoAssetURL,
                                radius: 80,
                                addPadding: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                '$regNum - $name',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                            isEditable
                                ? Container(
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text('Edit Profile'),
                                    ),
                                  )
                                : const SizedBox(
                                    height: 15,
                                  ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: const Divider(
                                thickness: 2,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Text('Email: $email'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Text('Year: $year'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Text('Batch: $batch'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Text('Tutor: $tutor'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
