// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salmon/constants/Strings.dart';

class FromCreateMenuScreen extends StatefulWidget {
  const FromCreateMenuScreen({Key? key}) : super(key: key);

  @override
  State<FromCreateMenuScreen> createState() => _FromCreateMenuScreenState();
}

class _FromCreateMenuScreenState extends State<FromCreateMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              Strings.tileTextAppBarFromCreateMenuScreen,
              style: TextStyle(
                color: HexColor("#4A20A3"),
                fontFamily: 'prompt-medium',
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 80),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: ImageIcon(
                  size: 20,
                  AssetImage('assets/icons/ic_delete.png'),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: HexColor("#4A20A3"),
        ),
      ),
    );
  }
}
