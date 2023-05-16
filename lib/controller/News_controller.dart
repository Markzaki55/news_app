import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';


class NewsController extends GetxController {
  var isLoading = true.obs;
  var articleList = List<Article>.empty(growable: true).obs;

  Future<List<Article>> getDate() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=538b32eb56744f1fb066a2ab3e8ead93'));
      if (response.statusCode == 200) {
        final result = articlesFromJson(response.body);
        print(result);
        articleList.value = result.articles;
        return result.articles;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}