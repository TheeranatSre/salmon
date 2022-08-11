import 'package:flutter/material.dart';
import 'package:salmon/screens/CreateMenuScreen.dart';
import 'package:salmon/screens/HomeScreen.dart';
import 'package:salmon/screens/MenuScreen.dart';
import 'package:salmon/screens/SearchMenuScreen.dart';
import 'models/CounterModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 4,
        child: Scaffold(
            body: TabBarView(
              children: [
                HomeScreen(),
                SearchMenuScreen(),
                CreateMenuScreen(),
                MenuScreen()
              ],
            ),
            backgroundColor: Color.fromARGB(255, 100, 90, 245),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.home_rounded,
                )),
                Tab(
                    icon: Icon(
                  Icons.search_outlined,
                )),
                Tab(
                    icon: Icon(
                  Icons.post_add,
                )),
                Tab(
                    icon: Icon(
                  Icons.menu_open_sharp,
                ))
              ],
            )));
  }
}
