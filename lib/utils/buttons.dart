import 'package:chat_app/constants/size.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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

class ForgotPassButton extends StatelessWidget {
  const ForgotPassButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  label: 'Send Email',
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
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
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
      ),
    );
  }
}
