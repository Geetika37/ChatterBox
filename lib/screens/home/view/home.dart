import 'package:chat_app/screens/home/widgets/chatbody.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFaa554c),
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
                LabelText(
                  label: "ChatterBox",
                  textColor: Appcolor.homeText,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                Container(
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
              ],
            ),
          ),
          ChatBody(),
        ],
      ),
    );
  }
}
