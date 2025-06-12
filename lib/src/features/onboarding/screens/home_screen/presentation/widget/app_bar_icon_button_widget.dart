import 'package:flutter/material.dart';

import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';

class AppBarIconButtonWidget extends StatelessWidget {
  const AppBarIconButtonWidget({
    super.key, this.onTap, required this.iconData, this.paddingRight,
  });

  final VoidCallback? onTap;
  final IconData iconData;
  final double? paddingRight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: paddingRight ?? 8.0),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: AppColor.lightGreyColor,
          child: Icon(
            iconData,
            color: AppColor.greyColor,
            size: AppSpacing.screenHeight(context) * 0.022,
          ),
        ),
      ),
    );
  }
}