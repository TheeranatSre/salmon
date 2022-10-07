// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salmon/bloc/MyAppBloc.dart';
import 'package:salmon/widgets/MenuListWidgete.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyAppBloc>().add(GetMenusEvent());
  }

  @override
  Widget build(BuildContext context) {
    //Map<String, Object> values = <String, Object>{'counter': 1};
    //SharedPreferences.setMockInitialValues(values);
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
      body: BlocConsumer<MyAppBloc, MyAppState>(
        builder: ((context, state) {
          if (state is StateLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: HexColor("#a278fa"),
              ),
            );
          } else if (state is StateGetMenuStateSuccess) {
            return Column(
              children: state.menus.map((menu) {
                return MenuListWidget(
                  name: menu.name,
                  detail: menu.detail,
                  image: menu.image,
                );
              }).toList(),
            );
          } else if (state is StateError) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(state.message),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/');
                  },
                  child: Text('ปิด'),
                )
              ],
            );
          }
          return Container();
        }),
        listener: (context, state) {
          if (state is StateError) {
            print(state);
          }
        },
      ),
    );
  }
}
