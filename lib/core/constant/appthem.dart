import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeEnglish = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
        titleLarge: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.black,
        ),
        titleMedium: GoogleFonts.cairo(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColor.black,
        ),
        titleSmall: GoogleFonts.cairo(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColor.black,
        ),
        bodyLarge: GoogleFonts.abel(
          color: AppColor.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )),
    listTileTheme: const ListTileThemeData(iconColor: AppColor.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.black),
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(color: AppColor.white, elevation: 0));
ThemeData themeArabic = ThemeData(
  appBarTheme: const AppBarTheme(color: AppColor.primaryColor, elevation: 0),
  textTheme:  TextTheme(


     titleLarge: GoogleFonts.tajawal(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColor.black,
        ),
        titleMedium: GoogleFonts.tajawal(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColor.black,
        ),
        titleSmall: GoogleFonts.tajawal(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColor.black,
        ),
        bodyLarge: GoogleFonts.abel(
          color: AppColor.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )
      ),
  primarySwatch: Colors.blue,
);
