
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    required this.prefixIcon, 
     this.obscureText=false,
  });
  final Widget prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText:obscureText ,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}