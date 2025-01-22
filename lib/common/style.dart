import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const Color primaryColor = Color(0xFF69247C);
// const Color secondaryColor = Color(0xFFDA498D);
// const Color whiteColor = Color(0xFFFFFCF9);
// const Color blackColor = Color(0xFF212121);

const Color darkPrimaryColor = Color(0XFF181818);
const Color darkSecondaryColor = Color.fromARGB(255, 68, 68, 68);
const Color darkWhiteColor = Color(0xFFFFFFFF);
const Color darkBlackColor = Color(0XFF3D3D3D);

const Color lightPrimaryColor = Color(0xFFFFFFFF);
const Color lightSecondaryColor = Color.fromARGB(255, 216, 216, 216);
const Color lightWhiteColor = Color(0xFF181818);
const Color lightBlackColor = Color(0xFF3D3D3D);

const Color redPrimaryColor = Color(0xFFFF0000);
const Color redSecondaryColor = Color(0xFF8B0000);
const Color redWhiteColor = Color(0xFFFFC0C0);
const Color redBlackColor = Color(0xFF550000);

const Color yellowPrimaryColor = Color(0xFFFFFF00);
const Color yellowSecondaryColor = Color(0xFFCCCC00);
const Color yellowWhiteColor = Color(0xFFFFF9C4);
const Color yellowBlackColor = Color(0xFF8B8000);

const Color greenPrimaryColor = Color(0xFF008000);
const Color greenSecondaryColor = Color(0xFF006400);
const Color greenWhiteColor = Color(0xFFA8D08D);
const Color greenBlackColor = Color(0xFF2C6B2F);

const Color bluePrimaryColor = Color(0xFF0000FF);
const Color blueSecondaryColor = Color(0xFF00008B);
const Color blueWhiteColor = Color(0xFFADD8E6);
const Color blueBlackColor = Color(0xFF003366);

const Color brownPrimaryColor = Color(0xFF8B4513);
const Color brownSecondaryColor = Color(0xFF4B2C20);
const Color brownWhiteColor = Color(0xFFD2B48C);
const Color brownBlackColor = Color(0xFF3E2723);

final ThemeData myLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: lightPrimaryColor,
  scaffoldBackgroundColor: lightPrimaryColor,
  appBarTheme: const AppBarTheme(
    color: lightSecondaryColor,
    iconTheme: IconThemeData(color: lightWhiteColor),
    titleTextStyle: TextStyle(color: lightWhiteColor),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: lightWhiteColor),
    displayMedium: TextStyle(color: lightWhiteColor),
    displaySmall: TextStyle(color: lightWhiteColor),
    headlineLarge: TextStyle(color: lightWhiteColor),
    headlineMedium: TextStyle(color: lightWhiteColor),
    headlineSmall: TextStyle(color: lightWhiteColor),
    titleLarge: TextStyle(color: lightWhiteColor),
    titleMedium: TextStyle(color: lightWhiteColor),
    titleSmall: TextStyle(color: lightWhiteColor),
    bodyLarge: TextStyle(color: lightWhiteColor),
    bodyMedium: TextStyle(color: lightWhiteColor),
    bodySmall: TextStyle(color: lightWhiteColor),
    labelLarge: TextStyle(color: lightWhiteColor),
    labelMedium: TextStyle(color: lightWhiteColor),
    labelSmall: TextStyle(color: lightWhiteColor),
  ),
  iconTheme: const IconThemeData(color: lightWhiteColor)
);

final ThemeData myDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: darkPrimaryColor,
  scaffoldBackgroundColor: darkPrimaryColor,
  appBarTheme: const AppBarTheme(
    color: darkSecondaryColor,
    iconTheme: IconThemeData(color: darkWhiteColor),
    titleTextStyle: TextStyle(color: darkWhiteColor),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: darkWhiteColor),
    displayMedium: TextStyle(color: darkWhiteColor),
    displaySmall: TextStyle(color: darkWhiteColor),
    headlineLarge: TextStyle(color: darkWhiteColor),
    headlineMedium: TextStyle(color: darkWhiteColor),
    headlineSmall: TextStyle(color: darkWhiteColor),
    titleLarge: TextStyle(color: darkWhiteColor),
    titleMedium: TextStyle(color: darkWhiteColor),
    titleSmall: TextStyle(color: darkWhiteColor),
    bodyLarge: TextStyle(color: darkWhiteColor),
    bodyMedium: TextStyle(color: darkWhiteColor),
    bodySmall: TextStyle(color: darkWhiteColor),
    labelLarge: TextStyle(color: darkWhiteColor),
    labelMedium: TextStyle(color: darkWhiteColor),
    labelSmall: TextStyle(color: darkWhiteColor),
  ),
  iconTheme: const IconThemeData(color: darkWhiteColor)
);

TextTheme myTextTheme(String font) {
  return TextTheme(
    displayLarge: GoogleFonts.getFont(font,
      fontSize: 92,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    displayMedium: GoogleFonts.getFont(font,
      fontSize: 57,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    displaySmall: GoogleFonts.getFont(font,
      fontSize: 46,
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: GoogleFonts.getFont(font,
      fontSize: 42,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headlineMedium: GoogleFonts.getFont(font,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headlineSmall: GoogleFonts.getFont(font,
      fontSize: 23,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.getFont(font,
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    titleMedium: GoogleFonts.getFont(font,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    titleSmall: GoogleFonts.getFont(font,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.getFont(font,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: GoogleFonts.getFont(font,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    labelLarge: GoogleFonts.getFont(font,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    bodySmall: GoogleFonts.getFont(font,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    labelSmall: GoogleFonts.getFont(font,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}