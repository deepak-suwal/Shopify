import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    appBarTheme: const AppBarTheme(
      color: colorPrimary,
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: textColor,
        size: 16,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0XFF264143),
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0XFF264143),
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Color(0XFF264143),
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
