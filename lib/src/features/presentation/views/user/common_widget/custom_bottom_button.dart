import 'package:flutter/material.dart';

import '../../../../../app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    super.key,
    required this.title,
    this.subtext,
    required this.button,
  });

  final String title;
  final String? subtext;
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
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.darkGreyColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtext != null)
                  Text(
                    subtext!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColor.themeColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
              ],
            ),
            button,
          ],
        ),
      ),
    );
  }
}
