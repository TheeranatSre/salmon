// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salmon/widgets/MenuListWidgete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F2E5FF"),
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "สูตรอาหารแนะนำ",
            style: TextStyle(
              color: Color(0xFF4A20A3),
              fontFamily: 'prompt-medium',
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("menu").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
            if (!snapshots.hasData) {
              return Center();
            }
            return Column(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(4),
                      child: ListView(
                        children: snapshots.data?.docs.map((menu) {
                          return MenuListWidget(
                            name: menu["name"],
                            detail: menu["detail"],
                            image: menu["image"],
                          );
                        }).toList() as List<Widget>,
                      )),
                )
              ],
            );
          }),
    );
  }
}
