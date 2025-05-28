import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppInputDecoration {
  static InputDecorationTheme get inputDecoration {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: _getOutlineInputBorder(AppColor.primaryColor),
      enabledBorder: _getOutlineInputBorder(AppColor.secondaryColor),
      focusedBorder: _getOutlineInputBorder(AppColor.primaryColor),
      errorBorder: _getOutlineInputBorder(AppColor.redColor),
      labelStyle: TextStyle(
        color: AppColor.blackColor,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: TextStyle(
        color: AppColor.greyColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static OutlineInputBorder _getOutlineInputBorder(Color color){
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.5,
      ),
    );
  } 
}