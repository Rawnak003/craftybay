import 'package:flutter/material.dart';

class AppColor{
  static const Color themeColor = Color(0xFF07ADAE);
  static const Color lightThemeColor = Color(0xFF65C4C8);
  static const Color primaryColor = Color(0xFF007297);
  static const Color secondaryColor = Color(0xFF43BEC2);
  static const Color itemBGColor = Color(0xFFCDEFEF);
  static const Color categoryBGColor = Color(0xFFDAF3F3);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0xFF808080);
  static const Color lightGreyColor = Color(0xFFEEEEEE);
  static const Color darkGreyColor = Color(0xFF424242);

  static const Color redColor = Color(0xFFC10000);
  static const Color greenColor = Color(0xFF00BD08);
  static const Color blueColor = Color(0xFF2196F3);
  static const Color purpleColor = Color(0xFF4A148C);
  static const Color orangeColor = Color(0xFFFFA500);
  static const Color yellowColor = Color(0xFFFFC107);
  static const Color cyanColor = Color(0xFF00FFFF);


  static const Color transparentColor = Colors.transparent;

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.r.toInt();
    final int green = color.g.toInt();
    final int blue = color.b.toInt();

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };
    return MaterialColor(color.value, shades);
  }
}