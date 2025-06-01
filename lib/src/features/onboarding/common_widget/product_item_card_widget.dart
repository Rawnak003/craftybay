import 'package:flutter/material.dart';

import '../../../../core/app/app_spacing.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';


class ProductItemCardWidget extends StatelessWidget {
  const ProductItemCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.screenHeight(context) * 0.18,
      width: AppSpacing.screenWidth(context) * 0.3,
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: AppSpacing.screenWidth(context) * 0.3,
              height: AppSpacing.screenWidth(context) * 0.25,
              decoration: BoxDecoration(
                color: AppColor.itemBGColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(
                  AppImages.shoeLogoPng,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Column(
                children: [
                  Text(
                    'Nike Air Max 270',
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.0025),
                  Row(
                    children: [
                      Text(
                        '\$ 99.99',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.themeColor,fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star,
                        color: AppColor.yellowColor,
                        size: 12,
                      ),
                      Text(
                        '4.5',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: AppSpacing.screenWidth(context) * 0.05,
                          height: AppSpacing.screenWidth(context) * 0.05,
                          decoration: BoxDecoration(
                            color: AppColor.themeColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            color: AppColor.whiteColor,
                            size: 16,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}