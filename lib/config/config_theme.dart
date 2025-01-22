import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigTheme with ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  bool get isDarkMode => currentTheme == ThemeMode.dark;

  ThemeMode get themeMode => currentTheme;

  Future<void> loadTheme() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool savedTheme = pref.getBool('isDarkMode') ?? false;
    currentTheme = savedTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> swithTheme() async{
    currentTheme = currentTheme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }

}