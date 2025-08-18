import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/routes/app_route_names.dart';
import '../../../../data/models/product_model.dart';
import 'custom_action_button.dart';

class ProductItemCardWidget extends StatelessWidget {
  const ProductItemCardWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutesName.productDetails, arguments: productModel.id);
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
                  child: Image.network(
                    productModel.photoUrls.first,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Column(
                  children: [
                    Text(
                      productModel.title,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.0025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productModel.currentPrice}',
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

