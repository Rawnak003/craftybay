import 'package:flutter/material.dart';

import '../../../core/app/app_spacing.dart';
import '../../../core/constants/colors.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key, required this.iconData, this.onTap, this.backgroundColor,
  });

  final IconData iconData;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSpacing.screenWidth(context) * 0.06,
        height: AppSpacing.screenWidth(context) * 0.06,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.themeColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          iconData,
          color: AppColor.whiteColor,
          size: 16,
        ),
      ),
    );
  }
}