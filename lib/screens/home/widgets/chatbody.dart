import 'package:chat_app/constants/size.dart';
import 'package:chat_app/screens/home/widgets/chatsingle_widget.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      width: ScreenSize.screenWidth(context),
      height: ScreenSize.screenHeight(context) / 1.15,
      decoration: BoxDecoration(
          color: Appcolor.homeText,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          SizedBoxHeight(height: 0.02),
          ChatWidget(),
          SizedBoxHeight(height: 0.01),
          Divider(color: Appcolor.lightBrown),
          SizedBoxHeight(height: 0.01),
          ChatWidget(),
        ],
      ),
    );
  }
}
