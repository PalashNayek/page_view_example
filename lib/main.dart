import 'package:flutter/material.dart';
import 'package:page_view_example/di/setup_locator.dart';
import 'package:page_view_example/screens/main_screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView with MVVM Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}
