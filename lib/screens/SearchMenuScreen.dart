// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchMenuScreen extends StatefulWidget {
  const SearchMenuScreen({Key? key}) : super(key: key);

  @override
  State<SearchMenuScreen> createState() => _SearchMenuScreenState();
}

class _SearchMenuScreenState extends State<SearchMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "ค้นหาเมนูอาหาร",
            style: TextStyle(
              color: Color(0xFF4A20A3),
              fontFamily: 'prompt-medium',
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
