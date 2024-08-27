import 'package:flutter/material.dart';
import 'package:shopping/pages/auth/login.dart';
import 'package:shopping/pages/auth/register.dart';
import 'package:shopping/pages/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Homescreen(),);
  }
}