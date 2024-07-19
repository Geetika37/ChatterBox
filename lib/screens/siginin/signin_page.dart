import 'package:chat_app/constants/size.dart';
import 'package:chat_app/constants/textstyle.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:chat_app/utils/textfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: ScreenSize.screenHeight(context) / 4.0,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF7f30fe),
                    Color(0xFF6380fb),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "SignIn",
                      style: roboto(Appcolor.white, 24.0, FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Login to your account",
                      style: roboto(Appcolor.lightBlue, 20.0, FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.0,
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
                        // height: ScreenSize.screenHeight(context) / 2,
                        width: ScreenSize.screenWidth(context),
                        decoration: BoxDecoration(
                          color: Appcolor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelTextField(label: "Email"),
                            SizedBox(
                                height:
                                    ScreenSize.screenHeight(context) * 0.01),
                            Textfield(
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Color(0xFF7f30fe),
                              ),
                            ),
                            SizedBox(
                                height:
                                    ScreenSize.screenHeight(context) * 0.01),
                            LabelTextField(label: "Password"),
                            Textfield(
                              obscureText: true,
                              prefixIcon: Icon(
                                Icons.password,
                                color: Color(0xFF7f30fe),
                              ),
                            ),
                            SizedBox(
                                height:
                                    ScreenSize.screenHeight(context) * 0.01),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: LabelTextField(
                                label: "Forgot Password?",
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                                height:
                                    ScreenSize.screenHeight(context) * 0.04),
                            Center(
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
                                          Color(0xFF7f30fe),
                                          Color(0xFF6380fb),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: LabelTextField(
                                        label: 'SignIn',
                                        textColor: Appcolor.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
