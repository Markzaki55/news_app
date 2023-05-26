import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/controller/News_controller.dart';
import 'package:news_app/model/news_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;

  final int articleIndex;
  const ArticleDetailsScreen(
      {Key? key, required this.articleIndex, required this.article})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final NewsController _controller = Get.find();
    final Article selectedArticle = _controller.articles[articleIndex];
    if (article == null) {
      print('its nullllllllllllllllllllllllllllll');
      return Scaffold(
        body: Center(
          child: Text('Article not found'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedArticle.title ?? 'A7a'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              selectedArticle.urlToImage ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'By ${selectedArticle.author ?? 'Unknown'}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    DateFormat.yMMMMd()
                        .format(selectedArticle.publishedAt ?? DateTime.now()),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    selectedArticle.description ?? '',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    selectedArticle.content ?? '',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Source: ${selectedArticle.source?.name ?? 'Unknown'}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
