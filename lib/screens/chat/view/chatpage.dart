import 'package:chat_app/screens/chat/widget/chat_message.dart';
import 'package:chat_app/screens/chat/widget/chat_personname.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Appcolor.homeBg,
      body: Container(
        margin: EdgeInsets.only(
          top: 25,
        ),
        child: Column(
          children: [
            ChatPersonName(),
            SizedBoxHeight(height: 0.035),
            ChatMessage()
          ],
        ),
      ),
    ));
  }
}

