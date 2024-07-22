
import 'package:chat_app/constants/size.dart';
import 'package:flutter/material.dart';

class SizedBoxWidth extends StatelessWidget {
  const SizedBoxWidth({
    super.key,
    required this.width,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: ScreenSize.screenWidth(context) * width);
  }
}