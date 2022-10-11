import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    secondary: Colors.red
  ),
  scaffoldBackgroundColor: Color.fromRGBO(10, 10, 10, 1),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(10, 10, 10, 1),
  ),
);