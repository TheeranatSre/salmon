// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    "email",
    "https://www.googleapis.com/auth/contacts.readonly",
  ]);

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Future<void> _setSharedPerference() async {
    final prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('isLogin');
    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    _setSharedPerference();
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "เมนู",
            style: TextStyle(
              color: Color(0xFF4A20A3),
              fontFamily: 'prompt-medium',
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _googleSignIn.disconnect();
            },
            child: Text('ออกจากระบบ'),
          ),
        ],
      ),
    );
  }
}
