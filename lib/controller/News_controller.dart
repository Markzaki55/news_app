import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/controller/NewsService%20.dart';
import 'package:news_app/model/news_model.dart';

class NewsController extends GetxController {
  var country = 'us'.obs;
  var category = 'general'.obs;
  var isLoading = true.obs;
  var articles = List<Article>.empty(growable: true).obs; 
  RxInt indexD = 2.obs;
  

  void Togglefav(RxBool isfav) {
   isfav.value = !isfav.value;
  }

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true); // Set isLoading to true before fetching news
      final newsService = NewsService();
      print('Before fetching news');

      final result = await newsService.getNews(category.value, country.value);
      articles.assignAll(result);
      print('After fetching news');
    } catch (e) {
      print(e);
    } finally {
      isLoading(false); // Set isLoading to false after fetching news
    }
  }
}
