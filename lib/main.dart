import 'package:flutter/material.dart';
import 'package:news_app/pages/main_screen.dart';
import 'package:news_app/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MainScreen(),
      theme: darkTheme,
    );
  }
}