import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/News_controller.dart';
import 'package:news_app/model/news_model.dart';

// ignore: must_be_immutable
class ArticleWidget extends StatelessWidget {
  final Article article;
  final NewsController _controller = Get.put(NewsController());
  final int index;
  RxBool isfav = false.obs;

  ArticleWidget({Key? key, required this.article, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final colors = [
      Colors.blue.shade200,
      Colors.green.shade200,
      Colors.pink.shade200,
      Colors.purple.shade200,
      Colors.orange.shade200,
      Colors.teal.shade200,
    ];
    final color = colors[random.nextInt(colors.length)];

    

    final placeholderImage = AssetImage('lib/assets/blank.jpg');
    final imageUrl = article.urlToImage ?? '';

    return Column(
      children: [
        const SizedBox(height: 3),
        Card(
          // elevation: 20,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: color,
          child: InkWell(
            onTap: () {
              _controller.indexD.value = index;
              Get.toNamed('/article-details');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(children: [
                Hero(
                  tag: 'a7a',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    child: 
                    imageUrl.isNotEmpty ? Image.network(
                            imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image(
                            image: placeholderImage,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? '',
                        style:  TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'By ${article.author ?? 'Unknown'} | ${article.publishedAt ?? 'Unknown'}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          IconButton(
                            onPressed: () {
                              _controller.Togglefav(isfav);
                            },
                            icon: Obx(() => Icon(
                                  isfav.value
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
