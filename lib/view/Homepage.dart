// import 'package:flutter/material.dart';
// import 'package:news_app/const.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:news_app/controller/News_controller.dart';
// import 'package:news_app/view/BotGnav.dart';
// import 'package:news_app/view/Theme/ThemeService%20.dart';

// import 'package:news_app/view/articlewidget.dart';

// import 'package:news_app/model/news_model.dart';

// class HomePage extends StatelessWidget {
//   final NewsController _controller = Get.put(NewsController());
//   var countryN = 'USA'.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.dark_mode_outlined),
//             onPressed: () {
//               ThemeService().changeTheme();
//             },
//           ),
//           elevation: 0.0,
//           title: Obx(() => Text('ايه الاخبار ${countryN.value}')),
//           centerTitle: true,
//           backgroundColor: Theme.of(context).colorScheme.secondary,
//           actions: [
//             PopupMenuButton(itemBuilder: (context) {
//               return [
//                 PopupMenuItem<int>(
//                   value: 0,
//                   child: Text("USA "),
//                 ),
//                 PopupMenuItem<int>(
//                   value: 1,
//                   child: Text("EGYPT"),
//                 ),
//                 PopupMenuItem<int>(
//                   value: 2,
//                   child: Text("JAPAN"),
//                 ),
//                 PopupMenuItem<int>(
//                   value: 3,
//                   child: Text("United Kingdom"),
//                 ),
//                 PopupMenuItem<int>(
//                   value: 4,
//                   child: Text("United Arab Emirates"),
//                 ),
//                 PopupMenuItem<int>(
//                   value: 5,
//                   child: Text("FRANCE"),
//                 ),
//                 PopupMenuItem<int>(
//                   value: 6,
//                   child: Text("Canada"),
//                 )
//               ];
//             }, onSelected: (value) {
//               if (value == 0) {
//                 _controller.country.value = 'us';
//                 countryN.value = 'USA';
//                 _controller.fetchNews();
//               } else if (value == 1) {
//                 countryN.value = 'مصر';
//                 _controller.country.value = 'eg';
//                 _controller.fetchNews();
//               } else if (value == 2) {
//                 _controller.country.value = 'jp';
//                 countryN.value = 'JAPAN';
//                 _controller.fetchNews();
//               } else if (value == 3) {
//                 countryN.value = 'UNITED KINGDOM';
//                 _controller.country.value = 'gb';
//                 _controller.fetchNews();
//               } else if (value == 4) {
//                 countryN.value = 'United Arab Emirates';
//                 _controller.country.value = 'ae';
//                 _controller.fetchNews();
//               } else if (value == 5) {
//                 countryN.value = 'FRANCE';
//                 _controller.country.value = 'fr';
//                 _controller.fetchNews();
//               } else if (value == 6) {
//                 countryN.value = 'CANDA';
//                 _controller.country.value = 'ca';
//                 _controller.fetchNews();
//               }
//             }),
//           ],
//         ),
//         bottomNavigationBar: BotGnav(),
//         body: Center(
//           child: Obx(() {
//             if (_controller.isLoading.value) {
//               return CircularProgressIndicator();
//             } else {
//               return ListView.builder(
//                 itemCount: _controller.articles.length,
//                 itemBuilder: (context, index) {
//                   final article = _controller.articles[index];
//                   return ArticleWidget(
//                     article: article,
//                     index: index,
//                   );
//                 },
//               );
//             }
//           }),
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:news_app/controller/News_controller.dart';
// import 'package:news_app/model/news_model.dart';
// import 'package:news_app/view/BotGnav.dart';
// import 'package:news_app/view/Theme/ThemeService%20.dart';
// import 'package:news_app/view/articlewidget.dart';

// class HomePage extends StatelessWidget {
//   final NewsController _controller = Get.put(NewsController());
//   final Map<String, String> _countries = {
//     'USA': 'us',
//     'EGYPT': 'eg',
//     'JAPAN': 'jp',
//     'UNITED KINGDOM': 'gb',
//     'United Arab Emirates': 'ae',
//     'FRANCE': 'fr',
//     'Canada': 'ca',
//   };
//   final RxString _selectedCountry = 'USA'.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.dark_mode_outlined),
//           onPressed: () {
//             ThemeService().changeTheme();
//           },
//         ),
//         elevation: 0.0,
//         title: Obx(() => Text('ايه الاخبار ${_selectedCountry.value}')),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.secondary,
//         actions: [
//           DropdownButton<String>(
//             value: _selectedCountry.value,
//             items: _countries.keys.map((String country) {
//               return DropdownMenuItem<String>(
//                 value: country,
//                 child: Text(country),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 _selectedCountry.value = newValue;
//                 _controller.country.value = _countries[newValue]!;
//                 _controller.fetchNews();
//               }
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: BotGnav(),
//       body: Center(
//         child: Obx(() {
//           if (_controller.isLoading.value) {
//             return CircularProgressIndicator();
//           } else {
//             return ListView.builder

//             (
//               itemCount: _controller.articles.length,
//           //    separatorBuilder: (BuildContext context, int index) => Divider(),
//               itemBuilder: (BuildContext context, int index) {
//                 final article = _controller.articles[index];
//                 return ArticleWidget(
//                   article: article,
//                   index: index,
//                 );
//               },
//             );
//           }
//         }),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/News_controller.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/BotGnav.dart';
import 'package:news_app/view/Theme/ThemeService%20.dart';
import 'package:news_app/view/articlewidget.dart';

class HomePage extends StatelessWidget {
  final NewsController _controller = Get.put(NewsController());
  final Map<String, String> _countries = {
    'امريكا': 'us',
    'مصر': 'eg',
    'يابان': 'jp',
    'انجلترا': 'gb',
    'امارات': 'ae',
    'فرنسا': 'fr',
    'كندا': 'ca',
  };
  final RxString _selectedCountry = 'امريكا'.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.dark_mode_outlined),
          onPressed: () {
            ThemeService().changeTheme();
          },
        ),
        elevation: 0.0,
        title: Obx(() => Text(
      'ايه الاخبار يا ${_selectedCountry.value}',
      style: TextStyle(
        fontFamily: 'Tahoma',
        //fontWeight: FontWeight.bold,
       // fontSize: 18.0,
      ),
    )),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String? newValue) {
              if (newValue != null) {
                _selectedCountry.value = newValue;
                _controller.country.value = _countries[newValue]!;
                _controller.fetchNews();
              }
            },
            itemBuilder: (BuildContext context) {
              return _countries.keys.map((String country) {
                return PopupMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList();
            },
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
              itemBuilder: (BuildContext context, int index) {
                final article = _controller.articles[index];
                return ArticleWidget(
                  article: article,
                  index: index,
                );
              },
            );
          }
        }),
      ),
    );
  }
}
