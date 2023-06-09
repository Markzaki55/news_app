import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/view/Theme/ThemeService%20.dart';
import 'const.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/News_controller.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/ArticleDetailsScreen%20.dart';
import 'package:news_app/view/Homepage.dart';

void main()async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Article article = Article(publishedAt: DateTime.now());
    final NewsController _controller = Get.put(NewsController());
    //  var index = Obx(() => _controller.indexD.value);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(
          name: '/article-details',
          page: () => ArticleDetailsScreen(
            articleIndex: _controller.indexD.value,
            article: article,
          ),
          transition: Transition.rightToLeft,
        ),
      ],
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}
