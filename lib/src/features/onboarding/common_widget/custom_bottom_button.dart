import 'package:craftybay/core/app/app_spacing.dart';
import 'package:craftybay/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({super.key, required this.title, required this.subtext, required this.button});

  final String title;
  final String subtext;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.screenHeight(context) * 0.075,
      width: AppSpacing.screenWidth(context),
      decoration: BoxDecoration(
        color: AppColor.itemBGColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColor.darkGreyColor, fontWeight: FontWeight.w600)),
                Text(subtext, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColor.themeColor, fontWeight: FontWeight.w800)),
              ],
            ),
            SizedBox(
              width: AppSpacing.screenWidth(context) * 0.3,
              child: button,
            ),
          ],
        ),
      ),
    );
  }
}
