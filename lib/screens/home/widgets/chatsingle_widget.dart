import 'package:chat_app/constants/size.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:chat_app/utils/sizedboxwidth.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/images/boy.jpg",
              height: ScreenSize.screenHeight(context) * 0.07,
              width: ScreenSize.screenWidth(context) * 0.14,
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
    );
  }
}
