import 'package:chat_app/screens/signup/widgets/signup_formcontainer.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/backgroundcontainer.dart';
import 'package:chat_app/utils/buttons.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                  child: LabelText(
                    label: "SignUp",
                    textColor: Appcolor.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: LabelText(
                    label: "Create a new Account",
                    textColor: Appcolor.lightBrown,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                FormContainerSignUp(),
                SignUpButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
