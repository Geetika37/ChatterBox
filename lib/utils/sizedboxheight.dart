
import 'package:chat_app/constants/size.dart';
import 'package:flutter/material.dart';

class SizedBoxHeight extends StatelessWidget {
  const SizedBoxHeight({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: ScreenSize.screenHeight(context) * height);
  }
}