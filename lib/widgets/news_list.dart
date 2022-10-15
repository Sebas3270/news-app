import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {

  final List<Article> news;
  final String type;

  const NewsList({Key? key, required this.news, this.type = 'allTiny'}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: news.length,
      itemBuilder: (context, index){

        switch (type) {
          case 'allTiny':
            return GestureDetector(
              onTap: () {
                newsService.selectedNew = news[index];
                Navigator.pushNamed(context, 'new');
              },
              child: _SecondaryNew( newArticle: news[index],)
            );
          case 'allBig':
            return GestureDetector(
                onTap: () {
                  newsService.selectedNew = news[index];
                  Navigator.pushNamed(context, 'new');
                },
                child: _TopBarCard( newArticle: news[index], index: index)
              );
          case 'firstBig':
            if(index == 0){
              return GestureDetector(
                onTap: () {
                  newsService.selectedNew = news[index];
                  Navigator.pushNamed(context, 'new');
                },
                child: _TopBarCard( newArticle: news[index], index: index)
              );
            }
            return GestureDetector(
              onTap: () {
                newsService.selectedNew = news[index];
                Navigator.pushNamed(context, 'new');
              },
              child: _SecondaryNew( newArticle: news[index],)
            );
          default:
            return GestureDetector(
              onTap: () {
                newsService.selectedNew = news[index];
                Navigator.pushNamed(context, 'new');
              },
              child: _SecondaryNew( newArticle: news[index],)
            );
        }

      },
    );
  }
}

class _SecondaryNew extends StatelessWidget {
  const _SecondaryNew({
    Key? key, 
    required this.newArticle,

  }) : super(key: key);

  final Article newArticle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12
      ),
      child: Row(
      
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: SizedBox(
              height: 60,
              width: 90,
              /*child: Image(
                image: newArticle.urlToImage != null ? NetworkImage(newArticle.urlToImage!) : NetworkImage('https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png'),
                fit: BoxFit.cover,
              ),*/
              child: ImageLoader(
                urlImage: newArticle.urlToImage, 
                heightContainer: 60, 
                sizeLoader: 15,
                widthContainer: 90,
              ),
            ),
          ),
      
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newArticle.title,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 15,
                    ),
                  ),
      
                  Text(
                    newArticle.source.name,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white54
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {

  const _TopBarCard({
    Key? key,
    required this.newArticle,
    required this.index,
  }) : super(key: key);

  final Article newArticle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              height: 250,
              width: double.infinity,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: newArticle.urlToImage != null ? NetworkImage(newArticle.urlToImage!) : NetworkImage('https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png'),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: ImageLoader(
                urlImage: newArticle.urlToImage, 
                heightContainer: 250, 
                sizeLoader: 50,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _InfoTag(
                      info: newArticle.source.name, 
                      color: Theme.of(context).colorScheme.secondary,
                    ),

                    _InfoTag(
                      info: DateFormat.yMMMd().format(newArticle.publishedAt), 
                      color: Colors.black.withOpacity(0.6)
                    )
                  ],
                ),
                Text(
                  newArticle.title,
                  maxLines: 2,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

class _InfoTag extends StatelessWidget {
  const _InfoTag({
    Key? key,
    required this.info, 
    required this.color,
  }) : super(key: key);

  final String info;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              info,
              style: const TextStyle(
                //backgroundColor: Theme.of(context).colorScheme.secondary,
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}