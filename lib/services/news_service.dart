import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class NewsService extends ChangeNotifier{

  final base_url = 'https://newsapi.org/v2';
  final String api_key = dotenv.env['API_KEY']!; //loading from dot env
  List<Article> headlines = [];

  NewsService(){
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri(
      scheme: 'https',
      host: 'newsapi.org',
      path: '/v2/top-headlines',
      queryParameters: {'apiKey': api_key, 'country': 'mx'}
    );

    final res = await http.get(url);
    
    final newsResponse = News.fromJson(res.body);
    
    headlines.addAll( newsResponse.articles );
    notifyListeners();

  }

}