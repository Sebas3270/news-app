import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    secondary: Colors.red
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 27, 27, 27),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 27, 27, 27),
  ),
);