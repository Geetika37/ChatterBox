import 'package:chat_app/constants/size.dart';
import 'package:chat_app/screens/signup/view/siginup.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/backgroundcontainer.dart';
import 'package:chat_app/utils/buttons.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:chat_app/utils/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final _formKey = GlobalKey<FormState>();

  String email = "";

  TextEditingController usermailController = TextEditingController();

  // creating a function for reset password

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Password Reset Email has been sent ',
            style: TextStyle(fontSize: 10),
          ),
        ),
      );
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No User found for this email',
              style: TextStyle(fontSize: 10),
            ),
          ),
        );
      }
    }
  }

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
                    label: "Password Recovery",
                    textColor: Appcolor.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: LabelText(
                    label: "Enter your Email",
                    textColor: Appcolor.lightBrown,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
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
                      height: ScreenSize.screenHeight(context) / 3,
                      width: ScreenSize.screenWidth(context),
                      decoration: BoxDecoration(
                        color: Appcolor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBoxHeight(height: 0.02),
                            LabelText(label: "Email"),
                            SizedBoxHeight(height: 0.01),
                            Textfield(
                              controller: usermailController,
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Appcolor.appThemeColor,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter E-mail';
                                }
                                return null;
                              },
                            ),
                            SizedBoxHeight(height: 0.02),
                            ForgotPassButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    email = usermailController.text;
                                  });
                                }
                                resetPassword();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBoxHeight(height: 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelText(
                      label: "Don't have an account",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    LabelText(
                      onTap: () {
                        Get.to(() => const Signup());
                      },
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
