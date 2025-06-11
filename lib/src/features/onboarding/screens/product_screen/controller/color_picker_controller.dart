import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';


class ColorPickerController extends GetxController {
  final List<Color> colorOptions = [
    AppColor.blackColor,
    AppColor.blueColor,
    AppColor.redColor,
    AppColor.whiteColor,
    AppColor.greyColor
  ];

  var selectedIndex = 0.obs;

  void selectColor(int index) {
    selectedIndex.value = index;
  }
}
