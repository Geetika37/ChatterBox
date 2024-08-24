import 'package:chat_app/screens/siginin/view/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 2:17:00 here is where last stopped
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAQ8Itz6mzGKGoqfw7C-cjZ8nUKnwbClO8",
      appId: "1:969055506232:android:ef12ab6c7cc0b4a7d6fbcd",
      messagingSenderId: "969055506232",
      projectId: "chatterbox-23a9f",
      storageBucket: "chatterbox-23a9f.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInPage(),
      // home: const Signup(),
      // home: HomePage(),
    );
  }
}
