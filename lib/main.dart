import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/ArticleDetailsScreen%20.dart';
import 'package:news_app/view/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final Article article = Article();
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(
          name: '/article-details',
          page: () => ArticleDetailsScreen(article: article,),
          transition: Transition.rightToLeft,
        ),
      ],
      theme: ThemeData(
        useMaterial3: true,
        
        colorScheme: ColorScheme.light(background: Colors.white ,primary: Colors.red,secondary: Colors.orangeAccent,surfaceTint: Colors.grey[200])
      ),
    );
  }
}