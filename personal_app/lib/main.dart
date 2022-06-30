import 'package:flutter/material.dart';
import 'package:personal_app/screen/MyProfileScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MyProfileScreenView());
  }
}

