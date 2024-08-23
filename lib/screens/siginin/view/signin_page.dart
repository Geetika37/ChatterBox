import 'dart:math';

import 'package:chat_app/constants/size.dart';
import 'package:chat_app/screens/home/view/home.dart';
import 'package:chat_app/screens/signup/view/siginup.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/services/shared_prefs.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/backgroundcontainer.dart';
import 'package:chat_app/utils/buttons.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:chat_app/utils/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  String email = "", password = "", name = "", pic = "", username = "", id = "";
  TextEditingController usermailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();

  // creating a function for user login

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //  save values in sharedprefs
      QuerySnapshot querySnapshot =
          await DatabaseMethods().getUserbyemail(email);

      name = "${querySnapshot.docs[0]["Name"]}";
      username = "${querySnapshot.docs[0]["userName"]}";
      pic = "${querySnapshot.docs[0]["Photo"]}";
      id = "${querySnapshot.docs[0]["Id"]}";

      await SharedPrefsHelper().saveUserDisplayName(name);
      await SharedPrefsHelper().saveUserName(username);
      await SharedPrefsHelper().saveUserId(id);
      await SharedPrefsHelper().saveUserPic(pic);

      Get.offAll(() => const HomePage());
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No User Found for that Email',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'Wrong Password provided by user',
              style: TextStyle(fontSize: 18, color: Colors.black),
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
                    label: "SignIn",
                    textColor: Appcolor.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: LabelText(
                    label: "Login to your account",
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
                      height: ScreenSize.screenHeight(context) / 2,
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
                            LabelText(label: "Password"),
                            SizedBoxHeight(height: 0.01),
                            Textfield(
                              controller: userpasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                }
                                return null;
                              },
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
                                textColor:
                                    const Color.fromARGB(255, 219, 19, 29),
                              ),
                            ),
                            SizedBoxHeight(height: 0.04),
                            SigninButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    email = usermailController.text;
                                    password = userpasswordController.text;
                                  });
                                }
                                userLogin();
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
