import 'package:flutter/material.dart';
import 'package:flutter_8_a/homePage.dart';
import 'package:flutter_8_a/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
