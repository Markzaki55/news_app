import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/articlewidget.dart';

class Homepage extends StatelessWidget {
  final NewsController _controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News USA"),
      ),
      body: FutureBuilder<List<Article>>(
        future: _controller.getDate(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<Article> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, int index) {
                return ArticleWidget(article: data[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
