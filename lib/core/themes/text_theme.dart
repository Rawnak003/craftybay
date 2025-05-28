import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTextTheme {
  static TextTheme get appTextTheme {
    return TextTheme(
      headlineMedium: TextStyle(
        color: AppColor.blackColor,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: AppColor.greyColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: AppColor.greyColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}