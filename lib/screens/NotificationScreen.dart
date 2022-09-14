// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:salmon/constants/CustomColors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "แจ้งเตือน",
            style: TextStyle(
              color: Color(0xFF4A20A3),
              fontFamily: 'prompt-medium',
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("students").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (!snapshots.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshots.data?.docs.map((e) {
              return Text(e['fname']);
            }).toList() as List<Widget>,
          );
        },
      ),
    );
  }
}
