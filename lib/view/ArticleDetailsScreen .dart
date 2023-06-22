// // first design

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:intl/intl.dart';
// // import 'package:news_app/controller/News_controller.dart';
// // import 'package:news_app/model/news_model.dart';

// // class ArticleDetailsScreen extends StatelessWidget {
// //   final Article article;
// //   final int articleIndex;
// //   const ArticleDetailsScreen(
// //       {Key? key, required this.articleIndex, required this.article})
// //       : super(key: key);
// //   @override
// //   Widget build(BuildContext context) {
// //     final NewsController _controller = Get.find();
// //     final Article selectedArticle = _controller.articles[articleIndex];
// //     if (article == null) {
// //       print('its nullllllllllllllllllllllllllllll');
// //       return Scaffold(
// //         body: Center(
// //           child: Text('Article not found'),
// //         ),
// //       );
// //     }

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(selectedArticle.title ?? ''),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Card(
// //             elevation: 8,
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(16),
// //             ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Hero(
// //                   tag: selectedArticle.urlToImage ?? '',
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.only(
// //                       topLeft: Radius.circular(16),
// //                       topRight: Radius.circular(16),
// //                     ),
// //                     child: Image.network(
// //                       selectedArticle.urlToImage ?? '',
// //                       height: 200,
// //                       width: double.infinity,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         article.title ?? '',
// //                         style: TextStyle(
// //                           fontSize: 24,
// //                           fontWeight: FontWeight.bold,
// //                           fontFamily: 'Montserrat',
// //                         ),
// //                       ),
// //                       SizedBox(height: 8),
// //                       Row(
// //                         children: [
// //                           CircleAvatar(
// //                             backgroundImage: NetworkImage(
// //                               selectedArticle.urlToImage ?? '',
// //                             ),
// //                             radius: 16,
// //                           ),
// //                           SizedBox(width: 8),
// //                           Text(
// //                             'By ${selectedArticle.author ?? 'Unknown'}',
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               color: Colors.grey[600],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(height: 8),
// //                       Text(
// //                         DateFormat.yMMMMd().format(
// //                             selectedArticle.publishedAt ?? DateTime.now()),
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           color: Colors.grey[600],
// //                         ),
// //                       ),
// //                       SizedBox(height: 16),
// //                       Text(
// //                         selectedArticle.description ?? '',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontFamily: 'OpenSans',
// //                         ),
// //                       ),
// //                       SizedBox(height: 16),
// //                       Text(
// //                         selectedArticle.content ?? '',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontFamily: 'OpenSans',
// //                         ),
// //                       ),
// //                       SizedBox(height: 16),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Text(
// //                             'Source: ${selectedArticle.source?.name ?? 'Unknown'}',
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               color: Colors.grey[600],
// //                             ),
// //                           ),
// //                           Row(
// //                             children: [
// //                               IconButton(
// //                                 icon: Icon(Icons.bookmark_border),
// //                                 onPressed: () {},
// //                               ),
// //                               IconButton(
// //                                 icon: Icon(Icons.share),
// //                                 onPressed: () {},
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(height: 16),
// //                       Text(
// //                         'Comments',
// //                         style: TextStyle(
// //                           fontSize: 20,
// //                           fontWeight: FontWeight.bold,
// //                           fontFamily: 'Montserrat',
// //                         ),
// //                       ),
// //                       SizedBox(height: 16),
// //                       Container(
// //                         height: 200,
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(16),
// //                           color: Colors.grey[200],
// //                         ),
// //                         child: Center(
// //                           child: Text(
// //                             'No comments yet',
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               color: Colors.grey[600],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// //secound design

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:news_app/controller/News_controller.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/articlewidget.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
  final int articleIndex;
   

   ArticleDetailsScreen(
      {Key? key, required this.articleIndex, required this.article})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxBool isfav = ArticleWidget(article: article, index: articleIndex).isfav;

    final NewsController _controller = Get.find();
    final Article selectedArticle = _controller.articles[articleIndex];
    if (article == null) {
      print('its nullllllllllllllllllllllllllllll');
      return Scaffold(
        body: Center(
          child: Text('Article not found'),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'Hero',
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    child: Image.network(
                      selectedArticle.urlToImage ?? '',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 38,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    // color: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Positioned(
                  top: 38,
                  right: 16,
                  child: Row(
                    children: [
                      IconButton(
                        // color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          _controller.Togglefav(isfav);
                        },
                        icon: Obx(() => Icon( isfav.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            )),
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        // color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedArticle.title ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          selectedArticle.urlToImage ?? '',
                        ),
                        radius: 16,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'By ${selectedArticle.author ?? 'Unknown'}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    DateFormat.yMMMMd()
                        .format(selectedArticle.publishedAt ?? DateTime.now()),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    selectedArticle.description ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    selectedArticle.content ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Source: ${selectedArticle.source?.name ?? 'Unknown'}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        'No comments yet',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:news_app/controller/News_controller.dart';
// import 'package:news_app/model/news_model.dart';

// class ArticleDetailsScreen extends StatelessWidget {
//   final Article article;
//   final int articleIndex;
//   const ArticleDetailsScreen(
//       {Key? key, required this.articleIndex, required this.article})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final NewsController _controller = Get.find();
//     final Article selectedArticle = _controller.articles[articleIndex];
//     if (article == null) {
//       print('its nullllllllllllllllllllllllllllll');
//       return Scaffold(
//         body: Center(
//           child: Text('Article not found'),
//         ),
//       );
//     }

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).padding.top + 1,
//                 left: 16,
//                 right: 16,
//               ),
//               child: Stack(
//                 children: [
//                   Hero(
//                     tag: selectedArticle.urlToImage ?? '',
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(32),
//                       child: Image.network(
//                         selectedArticle.urlToImage ?? '',
//                         height: 300,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 32,
//                     left: 16,
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back),
//                       color: Colors.white,
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                   Positioned(
//                     top: 32,
//                     right: 16,
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.bookmark_border),
//                           color: Colors.white,
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.share),
//                           color: Colors.white,
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 16,
//                     left: 16,
//                     child: Container(
//                       width: MediaQuery.of(context).size.width - 32,
//                       child: Text(
//                         article.title ?? '',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Montserrat',
//                           color: Colors.white,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: NetworkImage(
//                           selectedArticle.urlToImage ?? '',
//                         ),
//                         radius: 16,
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         'By ${selectedArticle.author ?? 'Unknown'}',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     DateFormat.yMMMMd().format(
//                         selectedArticle.publishedAt ?? DateTime.now()),
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     selectedArticle.description ?? '',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'OpenSans',
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     selectedArticle.content ?? '',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'OpenSans',
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Source: ${selectedArticle.source?.name ?? 'Unknown'}',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Comments',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Montserrat',
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Container(
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       color: Colors.grey[200],
//                     ),
//                     child: Center(
//                       child: Text(
//                         'No comments yet',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }