// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'widgets/BottomNavBarWidgets.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'prompt-regular',
      ),
    );
  }
}
