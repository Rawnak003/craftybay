import 'package:flutter/material.dart';

import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/images.dart';
import '../../../../common_widget/item_counter_widget.dart';

class CustomCartProductWidget extends StatelessWidget {
  const CustomCartProductWidget({
    super.key, required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.verticalPadding),
        child: Row(
          children: [
            SizedBox(
              height: AppSpacing.screenWidth(context) * 0.25,
              width: AppSpacing.screenWidth(context) * 0.25,
              child: Image.asset(
                AppImages.shoeLogoPng,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: AppSpacing.screenWidth(context) * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nike Air Max 270',
                        style: Theme.of(context,).textTheme.titleMedium?.copyWith(
                          color: AppColor.darkGreyColor,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: AppColor.darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                  Text('Color: Black, Size: L', style: Theme.of(context,).textTheme.bodyMedium?.copyWith(color: AppColor.darkGreyColor,),),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$200', style: Theme.of(context,).textTheme.titleMedium?.copyWith(fontSize: 20, color: AppColor.themeColor,),),
                      ItemCounterWidget(
                        id: id,
                        onChanged: (value) {
                          print("Qty changed for $id → $value");
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}