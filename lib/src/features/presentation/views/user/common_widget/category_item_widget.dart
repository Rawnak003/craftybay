import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/routes/app_route_names.dart';


class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key, required this.iconData, required this.title,
  });

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutesName.productList, arguments: title),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppSpacing.screenWidth(context) * 0.2,
            height: AppSpacing.screenWidth(context) * 0.2,
            decoration: BoxDecoration(
              color: AppColor.categoryBGColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                iconData,
                color: AppColor.themeColor,
                size: AppSpacing.screenWidth(context) * 0.11,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.screenHeight(context) * 0.005),
          Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColor.themeColor, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}