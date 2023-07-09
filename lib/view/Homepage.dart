

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
