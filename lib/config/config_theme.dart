import 'package:flutter/material.dart';

class ConfigTheme with ChangeNotifier {
  ThemeMode _theme = ThemeMode.system;

  ThemeMode get thememode => _theme;

  void swithTheme(bool isDark){
    _theme = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}