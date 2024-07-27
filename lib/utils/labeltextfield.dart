import 'package:chat_app/constants/textstyle.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    super.key,
    required this.label,
    this.fontSize = 18,
    this.textColor = Appcolor.black,
    this.fontWeight = FontWeight.w500,
    this.onTap,
  });
  final String label;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: roboto(textColor, fontSize, fontWeight),
      ),
    );
  }
}
