// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:news_app/model/news_model.dart';

// class ArticleWidget extends StatelessWidget {
//   final Article article;

//   const ArticleWidget({Key? key, required this.article}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return Column(
//       children:  [
//          SizedBox(height: 3),
//         Card(
//           elevation: 20,
//           shadowColor: Colors.black,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: InkWell(
//             onTap: () {
//               Get.toNamed('/article-details', arguments: article);
//             },
//             child: Column(
//               children: [
//                 if(article.urlToImage != null){
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: FadeInImage.assetNetwork(
//                      // placeholder: 'lib/assets/blank.jpg',
//                       image: article.urlToImage ??'',
//                       height: 220,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                   ),
//                 ),}else{
//                   ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.asset(
//             'assets/blank.jpg',
//             height: 200,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),

//                 }
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         article.title ?? '',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                        SizedBox(height: 8),
//                     Text(
//                       article.description ?? '',
//                       style: TextStyle(
//                         fontSize: 16,
//                        ),
//                    ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
          
//         ),
//       ],
//     );
   
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/news_model.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
         SizedBox(height: 3),
        Card(
          elevation: 20,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: InkWell(
            onTap: () {
              Get.toNamed('/article-details', arguments: article);
            },
            child: Column(
              children: [
                 article.urlToImage != null
        ? ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
              article.urlToImage??'',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
        )
        : ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
              'lib/assets/blank.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
        ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        article.description ?? '',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),  
        ),
      ],
    );
  }
}