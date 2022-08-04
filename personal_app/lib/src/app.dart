import 'package:flutter/material.dart';
import 'package:personal_app/src/screens/LoginScreenView.dart';
import 'package:personal_app/src/screens/MessagesAnonymousScreenView.dart';
import 'package:personal_app/src/screens/MessagesCompanyScreen.dart';
import 'package:personal_app/src/screens/MyProfileScreenView.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, 
        home:  MyProfileScreenView()
        );
  }
}
