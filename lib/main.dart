import 'package:flutter/material.dart';
import 'package:news_app/providers/providers.dart';
import 'package:news_app/screens/main_screen.dart';
import 'package:news_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppProviders());

class AppProviders extends StatelessWidget {
  const AppProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenProvider(),)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: MainScreen(),
      theme: darkTheme,
    );
  }
}