// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salmon/screens/FromCreateMunuScreen.dart';

import '../constants/Strings.dart';

class CreateMenuScreen extends StatefulWidget {
  const CreateMenuScreen({Key? key}) : super(key: key);

  @override
  State<CreateMenuScreen> createState() => _CreateMenuScreenState();
}

class _CreateMenuScreenState extends State<CreateMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F2E5FF"),
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "เพิ่มสูตรอาหาร",
            style: TextStyle(
              color: HexColor("#4A20A3"),
              fontFamily: 'prompt-medium',
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
          padding: EdgeInsets.all(12),
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 12),
                      child: Image(
                        image: AssetImage('assets/images/im_cooking.png'),
                        width: 108,
                        height: 107,
                      ),
                    ),
                    Text(
                      Strings.titleTextAddMenu,
                      style: TextStyle(fontFamily: 'prompt-bold'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Text(
                        Strings.subtitleTextAddMenu,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(120, 38),
                            primary: HexColor("#FFA978"),
                            onPrimary: Colors.black,
                            onSurface: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FromCreateMenuScreen(),
                            ),
                          );
                        },
                        child: Text(Strings.buttonCreateMenu),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
