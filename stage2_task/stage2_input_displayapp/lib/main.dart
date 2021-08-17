import 'package:flutter/material.dart';
import 'package:stage2_input_displayapp/src/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNG Input Displayer',
      home: HomeScreen(),
    );
  }
}
