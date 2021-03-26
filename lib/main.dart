import 'package:flutter/material.dart'; // библиотека для проектирования material дизайна
import 'myHomePage.dart';

void main() {
  // начало программы
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}