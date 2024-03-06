import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.c_9b2226,
      primaryColor: AppColors.black,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.transparent,
              statusBarIconBrightness: Brightness.light)),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 57, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        displayMedium:TextStyle(fontSize: 45, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        displaySmall: TextStyle(fontSize: 36, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        headlineLarge: TextStyle(fontSize: 32, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        headlineMedium: TextStyle(fontSize: 28, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        headlineSmall: TextStyle(fontSize: 24, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        titleLarge: TextStyle(fontSize: 22, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 16, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 14, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        labelLarge: TextStyle(fontSize: 14, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        labelMedium: TextStyle(fontSize: 12, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 11, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 16, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(fontSize: 14, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(fontSize: 12, color: AppColors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),

      ),
      iconTheme:IconThemeData(color: AppColors.black) );
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.c_0C0926,
      primaryColor: AppColors.white,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.transparent,
              statusBarIconBrightness: Brightness.dark)),
      textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 57, color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400),
        displayMedium:TextStyle(fontSize: 45, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        displaySmall: TextStyle(fontSize: 36, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        headlineLarge: TextStyle(fontSize: 32, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        headlineMedium: TextStyle(fontSize: 28, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        headlineSmall: TextStyle(fontSize: 24, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400),
        titleLarge: TextStyle(fontSize: 22, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 16, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 14, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        labelLarge: TextStyle(fontSize: 14, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        labelMedium: TextStyle(fontSize: 12, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 11, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 16, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(fontSize: 14, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(fontSize: 12, color: AppColors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500),

      ),
      iconTheme:IconThemeData(color: AppColors.black) );
}