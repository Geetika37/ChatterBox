import 'package:chat_app/constants/size.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/buttons.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:chat_app/utils/textfield.dart';
import 'package:flutter/material.dart';

class FormContainerSignIn extends StatelessWidget {
  const FormContainerSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 25.0,
      ),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 20.0,
          ),
          height: ScreenSize.screenHeight(context) / 2,
          width: ScreenSize.screenWidth(context),
          decoration: BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxHeight(height: 0.02),
              LabelText(label: "Email"),
              SizedBoxHeight(height: 0.01),
              Textfield(
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: Appcolor.appThemeColor,
                ),
              ),
              SizedBoxHeight(height: 0.02),
              LabelText(label: "Password"),
              SizedBoxHeight(height: 0.01),
              Textfield(
                obscureText: true,
                prefixIcon: Icon(
                  Icons.password,
                  color: Appcolor.appThemeColor,
                ),
              ),
              SizedBoxHeight(height: 0.01),
              Container(
                alignment: Alignment.bottomRight,
                child: LabelText(
                  label: "Forgot Password?",
                  fontSize: 16,
                  textColor: const Color.fromARGB(255, 219, 19, 29),
                ),
              ),
              SizedBoxHeight(height: 0.04),
              SigninButton(),
            ],
          ),
        ),
      ),
    );
  }
}
