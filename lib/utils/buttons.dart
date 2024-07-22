import 'package:chat_app/constants/size.dart';
import 'package:chat_app/screens/home/view/home.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(HomePage()),
      child: Center(
        child: SizedBox(
          width: ScreenSize.screenWidth(context) * 0.3,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5.0,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFd35249),
                    Color(0xFFd0333b),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: LabelText(
                  label: 'SIGNIN',
                  textColor: Appcolor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        width: ScreenSize.screenWidth(context),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 5.0,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFd35249),
                  Color(0xFFd0333b),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: LabelText(
                label: 'SIGN UP',
                textColor: Appcolor.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
