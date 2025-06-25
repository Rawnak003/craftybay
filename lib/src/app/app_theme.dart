import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import '../core/themes/elevated_button_theme.dart';
import '../core/themes/input_decoration_theme.dart';
import '../core/themes/text_theme.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColor.getMaterialColor(AppColor.themeColor),
      ),
      textTheme: AppTextTheme.appTextTheme,
      inputDecorationTheme: AppInputDecoration.inputDecoration,
      elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonTheme,
    );
  }
}
