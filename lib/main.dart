import 'dart:io';

import 'package:auth_mobile_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  //runApp(const MyApp());

  print("Enter your name?");
  // Reading name of the Geek
  String? name = stdin.readLineSync(); // null safety in name string

  // Printing the name
  print("Hello, $name! \nWelcome to GeeksforGeeks!!");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
