import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';
import 'dart:convert';



class NewsService {
  Future<List<Article>> getNews(String Cat) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$Cat&apiKey=538b32eb56744f1fb066a2ab3e8ead93'));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final articles = List<Article>.from(
          result['articles'].map((article) => Article.fromJson(article)));
      return articles;
    } else {
      throw Exception('Failed to load data');
    }
  }
}