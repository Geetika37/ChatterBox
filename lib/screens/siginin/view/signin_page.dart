import 'package:chat_app/screens/siginin/widgets/signin_formcontainer.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/backgroundcontainer.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundContainer(),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                Center(
                  child: LabelTextField(
                    label: "SignIn",
                    textColor: Appcolor.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: LabelTextField(
                    label: "Login to your account",
                    textColor: Appcolor.lightBrown,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                FormContainerSignIn(),
                SizedBoxHeight(height: 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelTextField(
                      label: "Don't have an account",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    LabelTextField(
                      label: 'Sign Up Now!',
                      textColor: Appcolor.appThemeColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
