import 'package:flutter/material.dart';
import 'package:company/values/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final AppTheme instance = AppTheme._();

  final _theme = ThemeData(
    primaryColor: const Color(0xff0066F9),
    scaffoldBackgroundColor: AppColors.backGround,
    appBarTheme: const AppBarTheme(
      color: AppColors.backGround,
      elevation: 0,
    ),
    datePickerTheme: const DatePickerThemeData(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: Colors.white,
      secondary: const Color(0xff14141E),
      shadow: const Color(0xff14141E).withOpacity(.1),
      error: const Color(0xffFF465C),
      tertiary: const Color(0xff1EACFC),
      errorContainer: const Color(0xffFF465C).withOpacity(.1),
      tertiaryContainer: const Color(0xff0066F9).withOpacity(.08),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all(AppColors.backGround),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.greyColor,
        height: 1.5,
      ),
      displayMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.orange,
      height: 1.5,
    ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.orange,
        height: 1.5,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        height: 1.5,
      ),
    ),
  );

  ThemeData getDarkTheme() {
    return _theme;
  }
}
