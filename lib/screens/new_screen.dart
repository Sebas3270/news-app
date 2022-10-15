import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_models.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);
    final currentNew = newsService.selectedNew;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context), 
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: ImageLoader(
                    urlImage: currentNew.urlToImage,
                    heightContainer: 300,
                    widthContainer: double.infinity,
                    sizeLoader: 50,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                      Text(
                        currentNew.source.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60
                        ),
                      ),

                      Text(
                        DateFormat.yMMMd().format(currentNew.publishedAt),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60
                        ),
                      ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  currentNew.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                _ArticleContent(currentNew: currentNew),
                
                const SizedBox(
                  height: 15,
                ),

                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Read complete article',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}

class _ArticleContent extends StatelessWidget {
  const _ArticleContent({
    Key? key,
    required this.currentNew,
  }) : super(key: key);

  final Article currentNew;

  @override
  Widget build(BuildContext context) {
    
    return (currentNew.content != null) ? Text(
      '${ currentNew.content }',
      style: TextStyle(
          fontSize: 16,
        ),
    ) : SizedBox();
  }
}