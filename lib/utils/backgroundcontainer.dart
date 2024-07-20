import 'package:chat_app/constants/size.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.screenHeight(context) / 3.5,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFd35249),
            Color(0xFFd0333b),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(
            ScreenSize.screenWidth(context),
            105.0,
          ),
        ),
      ),
    );
  }
}