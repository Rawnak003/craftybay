
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import 'custom_action_button.dart';

class ItemCounterWidget extends StatelessWidget {
  const ItemCounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        spacing: 8,
        children: [
          CustomActionButton(iconData: Icons.remove, backgroundColor: AppColor.lightThemeColor,),
          Text('1'),
          CustomActionButton(iconData: Icons.add),
        ],
      ),
    );
  }
}