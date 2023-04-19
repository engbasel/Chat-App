import 'package:chat_two/pages/ChatPage.dart';
import 'package:chat_two/pages/Homepage.dart';
import 'package:chat_two/pages/LoginPage.dart';
import 'package:chat_two/pages/RegesterPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Chat_vTWO());
}

class Chat_vTWO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.Id: (context) => LoginPage(),
        RegisterPage.Id: (context) => RegisterPage(),
        ChatPage.Id: (context) => ChatPage(),
        HomePage.Id: (context) => HomePage(),
      },
      initialRoute: HomePage.Id,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RegisterPage(),
      ),
    );
  }
}
