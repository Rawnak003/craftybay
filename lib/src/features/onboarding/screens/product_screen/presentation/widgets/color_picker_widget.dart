import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/colors.dart';
import '../../controller/color_picker_controller.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ColorPickerController controller = Get.find<ColorPickerController>();
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(controller.colorOptions.length, (index) {
          final color = controller.colorOptions[index];
          final isSelected = controller.selectedIndex.value == index;
          return GestureDetector(
            onTap: () => controller.selectColor(index),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(
                  color: color == AppColor.whiteColor ? AppColor.lightGreyColor : AppColor.transparentColor,
                  width: 2,
                ),
              ),
              child:
                isSelected
                    ? Icon(Icons.check, color: color == AppColor.whiteColor ? AppColor.blackColor : AppColor.whiteColor , size: 24)
                    : null,
            ),
          );
        }),
      ),
    );
  }
}
