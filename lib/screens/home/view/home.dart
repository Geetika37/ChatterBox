import 'package:chat_app/screens/home/widgets/chatbody.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  initialSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    setState(() {
      search = true;
    });
    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.isEmpty && value.length == 1) {
      DatabaseMethods().search(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.docs.length; ++i) {
          queryResultSet.add(docs.docs[i].data());
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['userName'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
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
                            initialSearch(value.toUpperCase());
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
                    search = true;
                    setState(() {});
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
          ChatBody(search: search),
        ],
      ),
    );
  }
}
