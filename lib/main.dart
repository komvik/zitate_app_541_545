import 'package:flutter/material.dart';
import 'package:zitate_app_541_545/screen/zitat_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZitatScreen(),
    );
  }
}
