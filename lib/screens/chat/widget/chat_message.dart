import 'package:chat_app/constants/size.dart';
import 'package:chat_app/screens/chat/widget/chat_send_message.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
      width: ScreenSize.screenWidth(context),
      height: ScreenSize.screenHeight(context) / 1.16,
      decoration: BoxDecoration(
        color: Appcolor.homeText,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: ScreenSize.screenWidth(context) / 2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 205, 179, 177),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Text("Helloo, How was the day?"),
          ),
          SizedBoxHeight(height: 0.01),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(right: ScreenSize.screenWidth(context) / 2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 139, 112, 111),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: Text("The Day was fantastic"),
          ),
          Spacer(),
          TypeMessage(),
          SizedBoxHeight(height: 0.02),
        ],
      ),
    );
  }
}
