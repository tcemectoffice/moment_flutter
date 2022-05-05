// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:moment/components/common/circle_image.dart';
// import 'package:moment/components/common/custom_scroll_settings.dart';
// import 'package:moment/models/constants.dart';

// class McteaHome extends StatefulWidget {
//   const McteaHome({Key? key}) : super(key: key);

//   @override
//   State<McteaHome> createState() => _McteaHomeState();
// }

// class _McteaHomeState extends State<McteaHome> {
//   final double activeElevation = 30;
//   final double inactiveElevation = 0;
//   final FontWeight activeTabWeight = FontWeight.w500;
//   final FontWeight inactiveTabWeight = FontWeight.w300;
//   final Color activeTabColor = Colors.white;
//   final Color inactiveTabColor = Colors.transparent;

//   int activeTab = 0;
//   bool isLoading = false;
//   PageController eventsPageController = PageController();

//   changeTab(int index) {
//     setState(() {
//       activeTab = index;
//     });
//     eventsPageController.animateToPage(index,
//         duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     eventsPageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const Center(
//             child: SizedBox(width: 120, child: LinearProgressIndicator()))
//         : CustomScrollConfig(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 100,
//                     padding: const EdgeInsets.symmetric(vertical: 20.0),
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       itemExtent: 90,
//                       children: [
//                         GestureDetector(
//                           onTap: () {},
//                           child: SizedBox(
//                             height: 90,
//                             child: Column(
//                               children: const [
//                                 CircleImage(
//                                   isAsset: true,
//                                   imgUrl: 'assets/images/tce_logo.png',
//                                   radius: 60.0,
//                                   addPadding: false,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: SizedBox(
//                             height: 90,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: const [
//                                 CircleImage(
//                                   isAsset: true,
//                                   imgUrl: 'assets/images/tutor_ward.jpeg',
//                                   radius: 60.0,
//                                   addPadding: false,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: SizedBox(
//                             height: 90,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: const [
//                                 CircleImage(
//                                   isAsset: true,
//                                   imgUrl: 'assets/images/tce_logo.png',
//                                   radius: 60.0,
//                                   addPadding: false,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: SizedBox(
//                             height: 90,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: const [
//                                 CircleImage(
//                                   isAsset: true,
//                                   imgUrl: 'assets/images/tutor_ward.jpeg',
//                                   radius: 60.0,
//                                   addPadding: false,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: SizedBox(
//                             height: 90,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: const [
//                                 CircleImage(
//                                   isAsset: true,
//                                   imgUrl: 'assets/images/tce_logo.png',
//                                   radius: 60.0,
//                                   addPadding: false,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: SizedBox(
//                             height: 90,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: const [
//                                 CircleImage(
//                                   isAsset: true,
//                                   imgUrl: 'assets/images/tutor_ward.jpeg',
//                                   radius: 60.0,
//                                   addPadding: false,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 19),
//                         child: Container(
//                           height: 140,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 19),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: GestureDetector(
//                                     behavior: HitTestBehavior.translucent,
//                                     onTap: () {
//                                       changeTab(0);
//                                     },
//                                     child: Material(
//                                       elevation: activeTab == 0
//                                           ? activeElevation
//                                           : inactiveElevation,
//                                       color: Colors.transparent,
//                                       child: Container(
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                             color: activeTab == 0
//                                                 ? activeTabColor
//                                                 : inactiveTabColor,
//                                             borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(15),
//                                               topRight: Radius.circular(15),
//                                             )),
//                                         child: Center(
//                                             child: Text(
//                                           "Ongoing",
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: activeTab == 0
//                                                   ? activeTabWeight
//                                                   : inactiveTabWeight),
//                                         )),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: GestureDetector(
//                                     behavior: HitTestBehavior.translucent,
//                                     onTap: () {
//                                       changeTab(1);
//                                     },
//                                     child: Material(
//                                       elevation: activeTab == 1
//                                           ? activeElevation
//                                           : inactiveElevation,
//                                       color: Colors.transparent,
//                                       child: Container(
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                             color: activeTab == 1
//                                                 ? activeTabColor
//                                                 : inactiveTabColor,
//                                             borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(15),
//                                               topRight: Radius.circular(15),
//                                             )),
//                                         child: Center(
//                                             child: Text(
//                                           "Upcoming",
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: activeTab == 1
//                                                   ? activeTabWeight
//                                                   : inactiveTabWeight),
//                                         )),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: GestureDetector(
//                                     behavior: HitTestBehavior.translucent,
//                                     onTap: () {
//                                       changeTab(2);
//                                     },
//                                     child: Material(
//                                       elevation: activeTab == 2
//                                           ? activeElevation
//                                           : inactiveElevation,
//                                       color: Colors.transparent,
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             color: activeTab == 2
//                                                 ? activeTabColor
//                                                 : inactiveTabColor,
//                                             borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(15),
//                                               topRight: Radius.circular(15),
//                                             )),
//                                         height: 50,
//                                         child: Center(
//                                             child: Text(
//                                           "Registered",
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: activeTab == 2
//                                                   ? activeTabWeight
//                                                   : inactiveTabWeight),
//                                         )),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: 690,
//                             padding: EdgeInsets.only(left: 14, top: 16),
//                             color: Colors.white,
//                             child: PageView.builder(
//                                 physics: NeverScrollableScrollPhysics(),
//                                 controller: eventsPageController,
//                                 itemCount: 3,
//                                 itemBuilder: (context, pageIndex) {
//                                   return Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Webinars",
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 10, bottom: 20),
//                                           child: Row(
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 14,
//                                                         horizontal: 7),
//                                                 child: AssociationCard(),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 14,
//                                                         horizontal: 7),
//                                                 child: AssociationCard(),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 14,
//                                                         horizontal: 7),
//                                                 child: AssociationCard(),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Text(
//                                         "Workshops",
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 10, bottom: 20),
//                                           child: Row(
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 14,
//                                                         horizontal: 7),
//                                                 child: AssociationCard(),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 14,
//                                                         horizontal: 7),
//                                                 child: AssociationCard(),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 14,
//                                                         horizontal: 7),
//                                                 child: AssociationCard(),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Text(
//                                         "Events",
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 10, bottom: 20),
//                                           child: Row(
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 14,
//                                                         horizontal: 7),
//                                                 child: AssociationCard(),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 14,
//                                                         horizontal: 7),
//                                                 child: AssociationCard(),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 14,
//                                                         horizontal: 7),
//                                                 child: AssociationCard(),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 }),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }
// }

// class AssociationCard extends StatefulWidget {
//   const AssociationCard({Key? key}) : super(key: key);

//   @override
//   _AssociationCardState createState() => _AssociationCardState();
// }

// class _AssociationCardState extends State<AssociationCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: 200,
//           height: 140,
//           decoration: BoxDecoration(
//             border: Border.all(),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Image(
//             image: AssetImage(appLogoAssetURL),
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           child: Container(
//             width: 200,
//             height: 30,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Center(
//               child: Text("Machine Learning"),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// //MCTEA OLD

// // import 'package:flutter/material.dart';
// // import 'package:moment/components/common/circle_image.dart';
// // import 'package:moment/components/common/custom_scroll_settings.dart';
// // import 'package:moment/components/mctea/category_card.dart';

// // class McteaHome extends StatefulWidget {
// //   const McteaHome({Key? key}) : super(key: key);

// //   @override
// //   _McteaHomeState createState() => _McteaHomeState();
// // }

// // class _McteaHomeState extends State<McteaHome> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return CustomScrollConfig(
// //       child: CustomScrollView(
// //         slivers: <Widget>[
// //           SliverToBoxAdapter(
// //             child: Container(
// //               padding:
// //                   const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const Text(
// //                     'Updates',
// //                     style:
// //                         TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
// //                   ),
// //                   Container(
// //                     height: 120,
// //                     padding: const EdgeInsets.symmetric(vertical: 20.0),
// //                     child: ListView(
// //                       scrollDirection: Axis.horizontal,
// //                       itemExtent: 100,
// //                       children: [
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: SizedBox(
// //                             height: 90,
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                               children: const [
// //                                 CircleImage(
// //                                   isAsset: true,
// //                                   imgUrl: 'assets/images/tce_logo.png',
// //                                   radius: 60.0,
// //                                   addPadding: false,
// //                                 ),
// //                                 Text(
// //                                   'MECT - General',
// //                                   style: TextStyle(fontSize: 12.0),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: SizedBox(
// //                             height: 90,
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                               children: const [
// //                                 CircleImage(
// //                                   isAsset: true,
// //                                   imgUrl: 'assets/images/tutor_ward.jpeg',
// //                                   radius: 60.0,
// //                                   addPadding: false,
// //                                 ),
// //                                 Text(
// //                                   'Tutor Ward',
// //                                   style: TextStyle(fontSize: 12.0),
// //                                 )
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: SizedBox(
// //                             height: 90,
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                               children: const [
// //                                 CircleImage(
// //                                   isAsset: true,
// //                                   imgUrl: 'assets/images/tce_logo.png',
// //                                   radius: 60.0,
// //                                   addPadding: false,
// //                                 ),
// //                                 Text(
// //                                   'MECT - General',
// //                                   style: TextStyle(fontSize: 12.0),
// //                                 )
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: SizedBox(
// //                             height: 90,
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                               children: const [
// //                                 CircleImage(
// //                                   isAsset: true,
// //                                   imgUrl: 'assets/images/tutor_ward.jpeg',
// //                                   radius: 60.0,
// //                                   addPadding: false,
// //                                 ),
// //                                 Text(
// //                                   'Tutor Ward',
// //                                   style: TextStyle(fontSize: 12.0),
// //                                 )
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: SizedBox(
// //                             height: 90,
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                               children: const [
// //                                 CircleImage(
// //                                   isAsset: true,
// //                                   imgUrl: 'assets/images/tce_logo.png',
// //                                   radius: 60.0,
// //                                   addPadding: false,
// //                                 ),
// //                                 Text(
// //                                   'MECT - General',
// //                                   style: TextStyle(fontSize: 12.0),
// //                                 )
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: SizedBox(
// //                             height: 90,
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                               children: const [
// //                                 CircleImage(
// //                                   isAsset: true,
// //                                   imgUrl: 'assets/images/tutor_ward.jpeg',
// //                                   radius: 60.0,
// //                                   addPadding: false,
// //                                 ),
// //                                 Text(
// //                                   'Tutor Ward',
// //                                   style: TextStyle(fontSize: 12.0),
// //                                 )
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const Divider(),
// //                   const Padding(
// //                     padding: EdgeInsets.only(top: 10.0),
// //                     child: Text(
// //                       'Events',
// //                       style: TextStyle(
// //                           fontSize: 16.0, fontWeight: FontWeight.w600),
// //                     ),
// //                   ),
// //                   Container(
// //                     height: 165,
// //                     padding: const EdgeInsets.symmetric(vertical: 20.0),
// //                     child: ListView(
// //                       scrollDirection: Axis.horizontal,
// //                       itemExtent: 200,
// //                       children: [
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Registrations Open',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/reg_open.jpeg',
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Ongoing Events',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/ongoing.jpeg',
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Future Events',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/future.jpeg',
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Past Events',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/past.jpg',
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.only(top: 10.0),
// //                     child: Text(
// //                       'Seminars/Workshops',
// //                       style: TextStyle(
// //                           fontSize: 16.0, fontWeight: FontWeight.w600),
// //                     ),
// //                   ),
// //                   Container(
// //                     height: 165,
// //                     padding: const EdgeInsets.symmetric(vertical: 20.0),
// //                     child: ListView(
// //                       scrollDirection: Axis.horizontal,
// //                       itemExtent: 200,
// //                       children: [
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Registrations Open',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/reg_open.jpeg',
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Future Workshops',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/future.jpeg',
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Past Workshops',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/past.jpg',
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.only(top: 10.0),
// //                     child: Text(
// //                       'Webinars',
// //                       style: TextStyle(
// //                           fontSize: 16.0, fontWeight: FontWeight.w600),
// //                     ),
// //                   ),
// //                   Container(
// //                     height: 165,
// //                     padding: const EdgeInsets.symmetric(vertical: 20.0),
// //                     child: ListView(
// //                       scrollDirection: Axis.horizontal,
// //                       itemExtent: 200,
// //                       children: [
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Registrations Open',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/reg_open.jpeg',
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Future Webinars',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/future.jpeg',
// //                           ),
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: const CategoryCard(
// //                             title: 'Past Webinars',
// //                             bgIsAsset: true,
// //                             bgUrl: 'assets/images/past.jpg',
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
