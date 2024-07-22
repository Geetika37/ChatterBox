

import 'package:chat_app/utils/appcolor.dart';
import 'package:flutter/material.dart';

class TypeMessage extends StatelessWidget {
  const TypeMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 5),
        decoration: BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Colors.black45),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Appcolor.homeBg,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Icon(
                  Icons.send,
                  color: Colors.white70,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
