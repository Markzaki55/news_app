import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeService extends GetxController {
  ThemeService() {
    _loadTheme();
  }

  Rx<AppTheme> _theme = AppTheme.light.obs;

  AppTheme get theme => _theme.value;

  ColorScheme get colorScheme {
    switch (_theme.value) {
      case AppTheme.light:
        return ColorScheme.light(
          primary: Colors.blue,
          primaryContainer: Colors.blue[700],
          secondary: Colors.orange,
          secondaryContainer: Colors.orange[700],
          surface: Colors.white,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
        );
      case AppTheme.dark:
        return ColorScheme.dark(
          primary: Colors.grey,
          primaryContainer: Colors.grey[700],
          secondary: Colors.greenAccent,
          secondaryContainer: Colors.greenAccent[700],
          surface: Colors.grey.shade800,
          background: Colors.grey.shade900,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
        );
      default:
        return ColorScheme.light(
          primary: Colors.blue,
          primaryContainer: Colors.blue[700],
          secondary: Colors.orange,
          secondaryContainer: Colors.orange[700],
          surface: Colors.white,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
        );
    }
  }

  void setTheme(AppTheme theme) async {
    _theme.value = theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', _theme.value.toString());
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');
    if (theme !=null) {
      _theme.value = AppTheme.values.firstWhere((value) => value.toString() == theme);
    }
  }
}
