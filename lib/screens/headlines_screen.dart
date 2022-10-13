import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HeadlinesScreen extends StatelessWidget {
  const HeadlinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                'Headlines',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: newsService.categories.length,
                itemBuilder: (context, index) => _CategoryTag(category: newsService.categories[index]),
              )
            ),
            Expanded(
              child: NewsList(
                news: newsService.categoryArticles[newsService.selectedCategory]!,
                topNew: true,
              )
            )
          ],
        ),
      ),
    );
  }
}

class _CategoryTag extends StatelessWidget {
  const _CategoryTag({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;


  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Text(
          '${ category.name[0].toUpperCase() }${ category.name.substring(1) }',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            //decoration: (newsService.selectedCategory == category.name) ? TextDecoration.underline : null,
            //decorationColor: (newsService.selectedCategory == category.name) ? Theme.of(context).colorScheme.secondary : null,
            //color: (newsService.selectedCategory == category.name) ? Theme.of(context).colorScheme.secondary : null,
            color: (newsService.selectedCategory == category.name) ? Colors.white : Colors.white38,
          ),
          
        ),
      ),
    );
  }
}