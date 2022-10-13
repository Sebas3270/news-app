import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    secondary: Colors.red
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(10, 10, 10, 1),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(10, 10, 10, 1),
  ),
);