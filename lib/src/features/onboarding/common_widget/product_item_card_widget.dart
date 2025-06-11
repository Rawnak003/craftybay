import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app/app_spacing.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/routes/app_route_names.dart';
import 'custom_action_button.dart';

class ProductItemCardWidget extends StatelessWidget {
  const ProductItemCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutesName.product);
      },
      child: SizedBox(
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
                  child: Image.asset(AppImages.shoeLogoPng, fit: BoxFit.contain),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Column(
                  children: [
                    Text(
                      'Nike Air Max 270',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.0025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$99.99',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColor.themeColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                        Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColor.yellowColor,
                              size: 12,
                            ),
                            Text(
                              '4.5',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        CustomActionButton(iconData: Icons.favorite_border),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

