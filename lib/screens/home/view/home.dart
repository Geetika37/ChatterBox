// import 'package:chat_app/constants/size.dart';
// import 'package:chat_app/screens/chat/view/chatpage.dart';
// import 'package:chat_app/services/database.dart';
// import 'package:chat_app/utils/appcolor.dart';
// import 'package:chat_app/utils/labeltextfield.dart';
// import 'package:chat_app/utils/sizedboxheight.dart';
// import 'package:chat_app/utils/sizedboxwidth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool search = false;

//   var queryResultSet = [];
//   var tempSearchStore = [];

//   // creating a function called initial search
//   initialSearch(value) {
//     if (value.length == 0) {
//       setState(() {
//         queryResultSet = [];
//         tempSearchStore = [];
//       });
//     }
//     setState(() {
//       search = true;
//     });
//     var capitalizedValue =
//         value.substring(0, 1).toUpperCase() + value.substring(1);

//     if (queryResultSet.isEmpty && value.length == 1) {
//       DatabaseMethods().search(value).then((QuerySnapshot docs) {
//         for (int i = 0; i < docs.docs.length; ++i) {
//           queryResultSet.add(docs.docs[i].data());
//         }
//       });
//     } else {
//       tempSearchStore = [];
//       queryResultSet.forEach((element) {
//         if (element['userName'].startsWith(capitalizedValue)) {
//           setState(() {
//             tempSearchStore.add(element);
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolor.homeBg,
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 20.0,
//               right: 20.0,
//               top: 40.0,
//               bottom: 20.0,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 search
//                     ? Expanded(
//                         child: TextField(
//                           onChanged: (value) {
//                             initialSearch(value.toUpperCase());
//                           },
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Search User',
//                             hintStyle: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       )
//                     : LabelText(
//                         label: "ChatterBox",
//                         textColor: Appcolor.homeText,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                 GestureDetector(
//                   onTap: () {
//                     search = true;
//                     setState(() {});
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Appcolor.homeText,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Icon(
//                       Icons.search,
//                       color: Appcolor.homeBg,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//             width: ScreenSize.screenWidth(context),
//             height: search
//                 ? MediaQuery.of(context).size.height / 1.19
//                 : ScreenSize.screenHeight(context) / 1.15,
//             decoration: BoxDecoration(
//               color: Appcolor.homeText,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             child: Column(
//               children: [
//                 SizedBoxHeight(height: 0.02),
//                 search
//                     ? ListView(
//                         shrinkWrap: true,
//                         padding: EdgeInsets.only(left: 10, right: 10),
//                         primary: false,
//                         children: tempSearchStore.map((element) {
//                           return buildResultCard(element);
//                         }).toList(),
//                       )
//                     : Column(
//                         children: [
//                           InkWell(
//                             onTap: () => Get.to(const ChatPage()),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(30),
//                                   child: Image.asset(
//                                     "assets/images/boy.jpg",
//                                     height:
//                                         ScreenSize.screenHeight(context) * 0.07,
//                                     width:
//                                         ScreenSize.screenWidth(context) * 0.14,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 SizedBoxWidth(width: 0.05),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBoxHeight(height: 0.003),
//                                     Text(
//                                       "Geetika Dinesh",
//                                       style: TextStyle(
//                                           color: Appcolor.black,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     Text(
//                                       "Hello..Whats'up Janu?",
//                                       style: TextStyle(
//                                         color: Colors.black54,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Spacer(),
//                                 Text(
//                                   "04:30PM",
//                                   style: TextStyle(
//                                     color: Colors.black54,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBoxHeight(height: 0.01),
//                           Divider(color: Appcolor.lightBrown),
//                           SizedBoxHeight(height: 0.01),
//                           InkWell(
//                             onTap: () => Get.to(const ChatPage()),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(30),
//                                   child: Image.asset(
//                                     "assets/images/boy.jpg",
//                                     height:
//                                         ScreenSize.screenHeight(context) * 0.07,
//                                     width:
//                                         ScreenSize.screenWidth(context) * 0.14,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 SizedBoxWidth(width: 0.05),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBoxHeight(height: 0.003),
//                                     Text(
//                                       "Geetika Dinesh",
//                                       style: TextStyle(
//                                           color: Appcolor.black,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     Text(
//                                       "Hello..Whats'up Janu?",
//                                       style: TextStyle(
//                                         color: Colors.black54,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Spacer(),
//                                 Text(
//                                   "04:30PM",
//                                   style: TextStyle(
//                                     color: Colors.black54,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildResultCard(data) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       child: Material(
//         elevation: 5,
//         borderRadius: BorderRadius.circular(10),
//         child: Container(
//           padding: EdgeInsets.all(18),
//           decoration: BoxDecoration(
//             color: Appcolor.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     data['Name'],
//                     style: TextStyle(
//                       color: Appcolor.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBoxHeight(height: 0.003),
//                   Text(
//                     data['userName'],
//                     style: TextStyle(
//                       color: Appcolor.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:chat_app/constants/size.dart';
import 'package:chat_app/screens/chat/view/chatpage.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:chat_app/utils/sizedboxwidth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool search = false;
  var queryResultSet = [];
  var tempSearchStore = [];

  // creating a function called initial search
  void initialSearch(String value) {
    if (value.isEmpty) {
      setState(() {
        queryResultSet.clear();
        tempSearchStore.clear();
      });
      return;
    }

    setState(() {
      search = true;
    });

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.isEmpty && value.length == 1) {
      DatabaseMethods().search(capitalizedValue).then((QuerySnapshot docs) {
        setState(() {
          queryResultSet = docs.docs.map((doc) => doc.data()).toList();
        });
        filterSearchResults(capitalizedValue);
      });
    } else {
      filterSearchResults(capitalizedValue);
    }
  }

  void filterSearchResults(String query) {
    setState(() {
      tempSearchStore = queryResultSet
          .where((element) => element['userName'].startsWith(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.homeBg,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 40.0,
              bottom: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                search
                    ? Expanded(
                        child: TextField(
                          onChanged: (value) {
                            initialSearch(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search User',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    : LabelText(
                        label: "ChatterBox",
                        textColor: Appcolor.homeText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      search = !search;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Appcolor.homeText,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.search,
                      color: Appcolor.homeBg,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            width: ScreenSize.screenWidth(context),
            height: search
                ? MediaQuery.of(context).size.height / 1.19
                : ScreenSize.screenHeight(context) / 1.15,
            decoration: BoxDecoration(
              color: Appcolor.homeText,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBoxHeight(height: 0.02),
                search
                    ? Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          children: tempSearchStore.map((element) {
                            return buildResultCard(element);
                          }).toList(),
                        ),
                      )
                    : Column(
                        children: [
                          InkWell(
                            onTap: () => Get.to(const ChatPage()),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    "assets/images/boy.jpg",
                                    height:
                                        ScreenSize.screenHeight(context) * 0.07,
                                    width:
                                        ScreenSize.screenWidth(context) * 0.14,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBoxWidth(width: 0.05),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBoxHeight(height: 0.003),
                                    Text(
                                      "Geetika Dinesh",
                                      style: TextStyle(
                                          color: Appcolor.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Hello..Whats'up Janu?",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "04:30PM",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBoxHeight(height: 0.01),
                          Divider(color: Appcolor.lightBrown),
                          SizedBoxHeight(height: 0.01),
                          InkWell(
                            onTap: () => Get.to(const ChatPage()),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    "assets/images/boy.jpg",
                                    height:
                                        ScreenSize.screenHeight(context) * 0.07,
                                    width:
                                        ScreenSize.screenWidth(context) * 0.14,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBoxWidth(width: 0.05),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBoxHeight(height: 0.003),
                                    Text(
                                      "Geetika Dinesh",
                                      style: TextStyle(
                                          color: Appcolor.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Hello..Whats'up Janu?",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "04:30PM",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildResultCard(data) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  data['Photo'],
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['Name'],
                    style: TextStyle(
                      color: Appcolor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBoxHeight(height: 0.003),
                  Text(
                    data['userName'],
                    style: TextStyle(
                      color: Appcolor.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
