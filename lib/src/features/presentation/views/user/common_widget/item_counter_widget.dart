import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';
import '../../../controller/user_controllers/item_counter_controller.dart';
import 'custom_action_button.dart';

class ItemCounterWidget extends StatelessWidget {
  final Function(int) onChanged;
  final String id;

  const ItemCounterWidget({
    super.key,
    required this.onChanged,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ItemCounterController>(tag: id);

    controller.value.listen((val) => onChanged(val));

    return Obx(() => Row(
      children: [
        CustomActionButton(
          iconData: Icons.remove,
          backgroundColor: AppColor.lightThemeColor,
          onTap: controller.decrement,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.verticalPadding),
          child: Text('${controller.value.value}'),
        ),
        CustomActionButton(
          iconData: Icons.add,
          onTap: controller.increment,
        ),
      ],
    ));
  }
}
