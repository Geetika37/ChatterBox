import 'package:chat_app/constants/size.dart';
import 'package:chat_app/screens/home/view/home.dart';
import 'package:chat_app/screens/siginin/view/signin_page.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/services/shared_prefs.dart';
import 'package:chat_app/utils/appcolor.dart';
import 'package:chat_app/utils/backgroundcontainer.dart';
import 'package:chat_app/utils/buttons.dart';
import 'package:chat_app/utils/labeltextfield.dart';
import 'package:chat_app/utils/sizedboxheight.dart';
import 'package:chat_app/utils/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  String email = "", password = "", name = "", confirmPassword = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  registration() async {
    if (password != null && password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        String id = randomAlphaNumeric(10);

        Map<String, dynamic> userInfoMap = {
          "Name": nameController.text,
          "E-mail": emailController.text,
          "userName": emailController.text.replaceAll('@gmail.com', ""),
          "Photo":
              "https://media.istockphoto.com/id/1361217779/photo/portrait-of-happy-teenage-boy-at-park.webp?b=1&s=170667a&w=0&k=20&c=hOYpnliBsXaoVHh9qp4BnksjwzFn4S7i8dWQMBlQggY=",
          "Id": id,
        };

        await DatabaseMethods().addUserDetails(userInfoMap, id);
        await SharedPrefsHelper().saveUserId(id);
        await SharedPrefsHelper().saveUserName(nameController.text);
        await SharedPrefsHelper().saveUserEmail(emailController.text);
        await SharedPrefsHelper().saveUserDisplayName(
            emailController.text.replaceAll('@gmail.com', ""));
        await SharedPrefsHelper().saveUserPic(
            "https://media.istockphoto.com/id/1361217779/photo/portrait-of-happy-teenage-boy-at-park.webp?b=1&s=170667a&w=0&k=20&c=hOYpnliBsXaoVHh9qp4BnksjwzFn4S7i8dWQMBlQggY=");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Registered Successfully!",
              style: TextStyle(fontSize: 20),
              
            ),
            backgroundColor: Colors.green,
            
          ),
          
        );
        Get.offAll(() => const HomePage());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Registered Successfully!",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exist",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
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
            child: SingleChildScrollView(
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
                        height: ScreenSize.screenHeight(context) / 1.5,
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
                              LabelText(label: "Name"),
                              SizedBoxHeight(height: 0.01),
                              Textfield(
                                controller: nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Appcolor.appThemeColor,
                                ),
                              ),
                              SizedBoxHeight(height: 0.02),
                              LabelText(label: "Email"),
                              SizedBoxHeight(height: 0.01),
                              Textfield(
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter E-mail';
                                  }
                                  return null;
                                },
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Appcolor.appThemeColor,
                                ),
                              ),
                              SizedBoxHeight(height: 0.02),
                              LabelText(label: "Password"),
                              SizedBoxHeight(height: 0.01),
                              Textfield(
                                controller: passController,
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
                              SizedBoxHeight(height: 0.02),
                              LabelText(label: "Confirm Password"),
                              SizedBoxHeight(height: 0.01),
                              Textfield(
                                obscureText: true,
                                controller: confirmPassController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Confirm Password';
                                  }
                                  return null;
                                },
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Appcolor.appThemeColor,
                                ),
                              ),
                              SizedBoxHeight(height: 0.03),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LabelText(
                                    label: "Already have an account? ",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  LabelText(
                                    onTap: () {
                                      Get.to(() => const SignInPage());
                                    },
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
                    ),
                  ),
                  SignUpButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email = emailController.text;
                          name = nameController.text;
                          password = passController.text;
                          confirmPassword = confirmPassController.text;
                        });
                      }
                      registration();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
