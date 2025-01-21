import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const Color primaryColor = Color(0xFF69247C);
// const Color secondaryColor = Color(0xFFDA498D);
// const Color whiteColor = Color(0xFFFFFCF9);
// const Color blackColor = Color(0xFF212121);

const Color darkPrimaryColor = Color(0XFF181818);
const Color darkSecondaryColor = Color(0XFF212121);
const Color darkWhiteColor = Color(0xFFFFFFFF);
const Color darkBlackColor = Color(0XFF3D3D3D);

const Color lightPrimaryColor = Color(0xFFFFFFFF);
const Color lightSecondaryColor = Color(0xFFF5F5F5);
const Color lightWhiteColor = Color(0xFF181818);
const Color lightBlackColor = Color(0xFF3D3D3D);

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

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.robotoCondensed(
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  displayMedium: GoogleFonts.robotoCondensed(
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displaySmall: GoogleFonts.robotoCondensed(
    fontSize: 46,
    fontWeight: FontWeight.w400,
  ),
  headlineMedium: GoogleFonts.robotoCondensed(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineSmall: GoogleFonts.robotoCondensed(
    fontSize: 23,
    fontWeight: FontWeight.w400,
  ),
  titleLarge: GoogleFonts.robotoCondensed(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleMedium: GoogleFonts.robotoCondensed(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: GoogleFonts.robotoCondensed(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyLarge: GoogleFonts.robotoCondensed(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyMedium: GoogleFonts.robotoCondensed(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  labelLarge: GoogleFonts.robotoCondensed(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  bodySmall: GoogleFonts.robotoCondensed(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  labelSmall: GoogleFonts.robotoCondensed(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);