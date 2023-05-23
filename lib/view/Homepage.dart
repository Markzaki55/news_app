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
        bottomNavigationBar: GNav(
            rippleColor: Colors.grey, // tab button ripple color when pressed
            hoverColor: Colors.grey, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 60,
            tabActiveBorder:
                Border.all(color: Colors.black, width: 1), // tab button border
            tabBorder:
                Border.all(color: Colors.grey, width: 1), // tab button border
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 900), // tab animation duration
            gap: 3, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: Colors.purple[900], // selected icon and text color
            iconSize: 30, // tab button icon size
            tabBackgroundColor:
                Colors.purple.withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'general',
                onPressed: () {
                  _controller.category.value = 'general';
                  _controller.fetchNews();
                },
              ),
              GButton(
                icon: Icons.sports_bar_rounded,
                text: 'sport',
                 onPressed: () {
                  _controller.category.value = 'sports';
                  _controller.fetchNews();
                },
              ),
              GButton(
                icon: Icons.laptop_mac,
                text: 'tech',
                 onPressed: () {
                  _controller.category.value = 'technology';
                  _controller.fetchNews();
                },
              ),
              GButton(
                icon: Icons.movie_creation,
                text: 'Entrtainment',
                 onPressed: () {
                  _controller.category.value = 'entertainment';
                  _controller.fetchNews();
                },
              ),
            ]),
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
