import 'package:flutter/material.dart';
import 'package:gallery_app/core/app_color/app_colors.dart';

class MyTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: AppColors.blue,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
