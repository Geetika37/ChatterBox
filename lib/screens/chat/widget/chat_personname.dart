
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/sizedboxwidth.dart';
import 'package:flutter/material.dart';

class ChatPersonName extends StatelessWidget {
  const ChatPersonName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Appcolor.lightBrown,
          ),
          SizedBoxWidth(width: 0.2),
          Text(
            "Geetika Dinesh",
            style: TextStyle(
                color: Appcolor.lightBrown,
                fontSize: 21,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}