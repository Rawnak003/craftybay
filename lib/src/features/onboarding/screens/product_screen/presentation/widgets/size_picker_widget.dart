import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/constants/colors.dart';
import '../../controller/size_picker_controller.dart';

class SizePickerWidget extends StatelessWidget {
  const SizePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizePickerController controller = Get.find<SizePickerController>();
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(controller.sizeOptions.length, (index) {
          final size = controller.sizeOptions[index];
          final isSelected = controller.selectedIndex.value == index;
          return GestureDetector(
            onTap: () => controller.selectSize(index),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColor.themeColor : AppColor.whiteColor,
                border: Border.all(
                  color: isSelected ? AppColor.transparentColor : AppColor.greyColor,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  size,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: isSelected ? AppColor.whiteColor : AppColor.greyColor , fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
