import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class MyThemeData {
  static const Color blackColor = Color(0xff242424);
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.blackColor,
          unselectedItemColor: AppColors.whiteColor,
          selectedIconTheme: IconThemeData(
            size: 50,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 15,
          ),
          unselectedIconTheme: IconThemeData(
            size: 50,
          )),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: AppColors.blackColor,
              fontSize: 30,
              fontWeight: FontWeight.bold)));
}
