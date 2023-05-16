// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:news_app/controller/news_controller.dart';
// import 'package:news_app/model/news_model.dart';

// class Homepage extends GetWidget {
//   final NewsController _controller = Get.put(NewsController());

//   Homepage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("News USA"),
//       ),
//       body: FutureBuilder<Article?>(
//         future: _controller.getDate(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data != null) {
//             Article data = snapshot.data!;
//             return ListView.builder(
//               itemCount: data.article.length,
//               itemBuilder: (context, int index) {
//                 return Card(
//                   elevation: 10,
//                   shadowColor: Colors.black,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: [
//                       Image.network(data.article[index].urlToImage!),
//                       Text(data.article[index].title),
//                       Text(data.article[index].description ?? ''),
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_model.dart';

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
                return Card(
                  elevation: 20,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Image.network(data[index].urlToImage ?? ''),
                      Text(data[index].title ?? ''),
                      Text(data[index].description ?? ''),
                    ],
                  ),
                );
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