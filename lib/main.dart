import 'package:flutter/material.dart';
import 'package:news_app/providers/providers.dart';
import 'package:news_app/screens/main_screen.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main()async{
  await dotenv.load(fileName: ".env"); //to loa dot env
  runApp( AppProviders());
}

class AppProviders extends StatelessWidget {
  const AppProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenProvider(),),
        ChangeNotifierProvider(create: (context) => NewsService(),)
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