// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:news_app/controller/news_controller.dart';
// import 'package:news_app/view/articlewidget.dart';

// import 'package:news_app/model/news_model.dart';

// class HomePage extends StatelessWidget {
//   final NewsController _controller = Get.put(NewsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News USA'),
//       ),
//       body: Center(
//         child: GetBuilder<NewsController>(
//           builder: (controller) {
//             if (controller.isLoading.value) {
//               return CircularProgressIndicator();
//             } else {
//               return ListView.builder(
//                 itemCount: controller.articles.length,
//                 itemBuilder: (context, index) {
//                   final article = controller.articles[index];
//                   return ArticleWidget(article: article);
//                 },
//               );
//             }
//           },
//         ),
//          ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/articlewidget.dart';

import 'package:news_app/model/news_model.dart';

class HomePage extends StatelessWidget {
  final NewsController _controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News USA'),
          centerTitle: true,
          backgroundColor: Colors.purple[900],
        ),
        body: Center(
          child: Obx(() {
            if (_controller.isLoading.value) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: _controller.articles.length,
                itemBuilder: (context, index) {
                  final article = _controller.articles[index];
                  return ArticleWidget(article: article);
                },
              );
            }
          }),
        ));
  }
}
