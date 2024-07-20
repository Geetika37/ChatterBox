import 'package:chat_app/constants/size.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:chat_app/utils/textfield.dart';
import 'package:flutter/material.dart';

class FormContainerSignUp extends StatelessWidget {
  const FormContainerSignUp({
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
          height: ScreenSize.screenHeight(context) / 1.5,
          width: ScreenSize.screenWidth(context),
          decoration: BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxHeight(height: 0.02),
              LabelTextField(label: "Name"),
              SizedBoxHeight(height: 0.01),
              Textfield(
                prefixIcon: Icon(
                  Icons.person,
                  color: Appcolor.appThemeColor,
                ),
              ),
              SizedBoxHeight(height: 0.02),
              LabelTextField(label: "Email"),
              SizedBoxHeight(height: 0.01),
              Textfield(
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: Appcolor.appThemeColor,
                ),
              ),
              SizedBoxHeight(height: 0.02),
              LabelTextField(label: "Password"),
              SizedBoxHeight(height: 0.01),
              Textfield(
                obscureText: true,
                prefixIcon: Icon(
                  Icons.password,
                  color: Appcolor.appThemeColor,
                ),
              ),
              SizedBoxHeight(height: 0.02),
              LabelTextField(label: "Confirm Password"),
              SizedBoxHeight(height: 0.01),
              Textfield(
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: Appcolor.appThemeColor,
                ),
              ),
              SizedBoxHeight(height: 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelTextField(
                    label: "Already have an account",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  LabelTextField(
                    label: 'Login In Now!',
                    textColor: Appcolor.appThemeColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
