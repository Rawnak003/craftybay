import 'package:flutter/material.dart';
import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../home_screen/presentation/widget/app_bar_icon_button_widget.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({
    super.key, required this.name, required this.reviewText,
  });

  final String name;
  final String reviewText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(color: AppColor.lightGreyColor),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.boxShadowColor,
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AppBarIconButtonWidget(iconData: Icons.perm_identity_outlined),
                Text(name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
            Text(reviewText, textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}