import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/const.dart';

class ThemeService {
  final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.black,
        secondary: Colors.grey.shade300,
        surfaceTint: Colors.grey[200]),
  );

  final darkTheme = ThemeData(
    
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
        background: Colors.black,
        primary: Colors.grey.shade300,
        secondary: Colors.black,
        surfaceTint: Colors.grey[200]),
  );

  final _getStorage = GetStorage();

  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());
  }
}
