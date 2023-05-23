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
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/controller/News_controller.dart';
import 'package:news_app/view/BotGnav.dart';

import 'package:news_app/view/articlewidget.dart';

import 'package:news_app/model/news_model.dart';

class HomePage extends StatelessWidget {
  final NewsController _controller = Get.put(NewsController());
  var countryN = 'USA'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text('News ${countryN.value}')),
          centerTitle: true,
          backgroundColor: Colors.purple[900],
          actions: [
                 PopupMenuButton(
                   itemBuilder: (context){
                     return [
                            PopupMenuItem<int>(
                                value: 0,
                                child: Text("USA "),
                            ),

                            PopupMenuItem<int>(
                                value: 1,
                                child: Text("EGYPT"),
                            ),

                            PopupMenuItem<int>(
                                value: 2,
                                child: Text("JAPAN"),
                            ),
                           PopupMenuItem<int>(
                                value: 3,
                                child: Text("United Kingdom"),
                            ),
                            PopupMenuItem<int>(
                                value: 4,
                                child: Text("United Arab Emirates"),
                            ),
                            PopupMenuItem<int>(
                                value: 5,
                                child: Text("FRANCE"),
                            ),
                             PopupMenuItem<int>(
                                value: 6,
                                child: Text("Canada"),
                            )


                        ];
                   },
                   onSelected:(value){
                      if(value == 0){
                         _controller.country.value = 'us';
                         countryN.value = 'USA';
                         _controller.fetchNews();
                      }else if(value == 1){
                        countryN.value = 'مصر';
                         _controller.country.value = 'eg';
                         _controller.fetchNews();
                      }else if(value == 2){
                         _controller.country.value = 'jp';
                         countryN.value = 'JAPAN';
                         _controller.fetchNews();
                      }
                      else if(value == 3){
                        countryN.value = 'UNITED KINGDOM';
                         _controller.country.value = 'gb';
                         _controller.fetchNews();
                      }
                      else if(value == 4){
                        countryN.value = 'United Arab Emirates';
                         _controller.country.value = 'ae';
                         _controller.fetchNews();
                      }
                      else if(value == 5){
                        countryN.value = 'FRANCE';
                         _controller.country.value = 'fr';
                         _controller.fetchNews();
                      }
                      else if(value == 6){
                        countryN.value = 'CANDA';
                         _controller.country.value = 'ca';
                         _controller.fetchNews();
                      }
                   }
                  ),

                   
            ],
        ),
        
        bottomNavigationBar: BotGnav(),
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
