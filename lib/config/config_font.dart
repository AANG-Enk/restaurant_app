import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigFont with ChangeNotifier {
  String font = 'Roboto Condensed';
  String get selectedFont => font;

  Future<void> loadFont() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    font = pref.getString('selectedFont') ?? 'Roboto Condensed';
    GoogleFonts.getFont(font);
    notifyListeners();
  }

  Future<void> changeFont(String newFont) async{
    font = newFont;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('selectedFont', newFont);
    GoogleFonts.getFont(newFont);
    notifyListeners();
  }
}