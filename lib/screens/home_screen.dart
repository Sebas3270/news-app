import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Change statusbar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final newsService = Provider.of<NewsService>(context);

    return NewsList(news: newsService.headlines);
  }
}