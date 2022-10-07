// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salmon/bloc/MyAppBloc.dart';
import 'package:salmon/routers/Routers.dart';

import 'widgets/BottomNavBarWidgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAppBloc(),
      child: MaterialApp.router(
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'prompt-regular',
        ),
        routeInformationParser: Routers.route.routeInformationParser,
        routerDelegate: Routers.route.routerDelegate,
        routeInformationProvider: Routers.route.routeInformationProvider,
      ),
    );
  }
}
