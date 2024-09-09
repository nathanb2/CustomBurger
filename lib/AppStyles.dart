import 'package:flutter/material.dart';
import 'AppColors.dart';

class AppStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.onBackground,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.onBackground,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.onBackground,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.onBackground,
  );

  static const TextStyle button = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.onPrimary,
  );

  // Additional styles (optional)
  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    color: AppColors.onBackground,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.onBackground,
  );

  // Dark mode styles (optional)
  static const TextStyle darkHeadline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.darkOnBackground,
  );

// ... other dark mode styles
}