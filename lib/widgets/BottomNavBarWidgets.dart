// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salmon/screens/CreateMenuScreen.dart';
import 'package:salmon/screens/HomeScreen.dart';
import 'package:salmon/screens/MenuScreen.dart';
import 'package:salmon/screens/NotificationScreen.dart';
import 'package:salmon/screens/SearchMenuScreen.dart';

import '../constants/Strings.dart';

class BottomNavBarWidgets extends StatefulWidget {
  const BottomNavBarWidgets({Key? key}) : super(key: key);

  @override
  State<BottomNavBarWidgets> createState() => _BottomNavBarWidgetsState();
}

class _BottomNavBarWidgetsState extends State<BottomNavBarWidgets> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  int _onSelectMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    const List<Widget> _navigationBarItem = <Widget>[
      HomeScreen(),
      SearchMenuScreen(),
      CreateMenuScreen(),
      NotificationScreen(),
      MenuScreen(),
    ];

    void _onSelectMenuBottomNavBar(int index) {
      setState(() {
        _onSelectMenuIndex = index;
      });
    }

    return Scaffold(
      body: _navigationBarItem.elementAt(_onSelectMenuIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _onSelectMenuIndex,
        onTap: _onSelectMenuBottomNavBar,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/ic_nav_home.png'),
              size: 20,
            ),
            label: Strings.homeBottomNavBarName,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              size: 20,
              AssetImage('assets/icons/ic_nav_search.png'),
            ),
            label: Strings.searchBottomNavBarName,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              size: 20,
              AssetImage('assets/icons/ic_nav_add_menu.png'),
            ),
            label: Strings.addMenuBottomNavBarName,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              size: 20,
              AssetImage('assets/icons/ic_nav_notification.png'),
            ),
            label: Strings.notificationBottomNavBarName,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              size: 20,
              AssetImage('assets/icons/ic_nav_menu.png'),
            ),
            label: Strings.menuBottomNavBarName,
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: HexColor("#4A20A3"),
      ),
    );
  }
}
