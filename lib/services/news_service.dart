import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class NewsService extends ChangeNotifier{

  final baseUrl = 'https://newsapi.org/v2';
  final String apiKey = dotenv.env['API_KEY']!; //loading from dot env
  List<Article> headlines = [];
  List<Category> categories = [
    Category(Icons.abc, 'general'),
    Category(Icons.abc, 'business'),
    Category(Icons.abc, 'entertainment'),
    Category(Icons.abc, 'health'),
    Category(Icons.abc, 'science'),
    Category(Icons.abc, 'sports'),
    Category(Icons.abc, 'technology'),
  ];
  String _selectedCategory = 'general';
  Map<String,List<Article>> categoryArticles = {};
  late Article selectedNew;

  NewsService(){

    getTopHeadlines();

    for (var element in categories) {
      categoryArticles[element.name] = [];
    }

    getNewsByCategory(_selectedCategory);
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory( String category ){
    _selectedCategory = category;
    getNewsByCategory(category);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = Uri(
      scheme: 'https',
      host: 'newsapi.org',
      path: '/v2/top-headlines',
      queryParameters: {'apiKey': apiKey, 'country': 'us'}
    );

    final res = await http.get(url);
    
    final newsResponse = News.fromJson(res.body);
    
    headlines.addAll( newsResponse.articles );
    notifyListeners();

  }

  getNewsByCategory( String category ) async{

    if (categoryArticles[category]!.isNotEmpty){
      return categoryArticles[category]!;
    }

    final url = Uri(
      scheme: 'https',
      host: 'newsapi.org',
      path: '/v2/top-headlines',
      queryParameters: {'apiKey': apiKey, 'country': 'us', 'category': category}
    );

    final res = await http.get(url);
    
    final newsResponse = News.fromJson(res.body);
    
    categoryArticles[category]!.addAll( newsResponse.articles );
    notifyListeners();
  }

}