import 'package:craftybay/src/features/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../app/app_spacing.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/strings.dart';
import '../../../../../controller/user_controllers/cart_list_controller.dart';
import '../../../../../controller/user_controllers/product_screen_controller.dart';
import '../../../common_widget/custom_action_button.dart';
import '../../../common_widget/item_counter_widget.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: SizedBox(
            width: AppSpacing.screenWidth(context) * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColor.yellowColor, size: 20),
                    SizedBox(width: AppSpacing.screenWidth(context) * 0.005),
                    Text(
                      '4.5',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.find<ProductScreenController>().gotoReview();
                      },
                      child: Text(
                        AppStrings.reviews,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                          color: AppColor.themeColor,
                        ),
                      ),
                    ),
                    Spacer(),
                    CustomActionButton(iconData: Icons.favorite_border),
                  ],
                ),
              ],
            ),
          ),
        ),
        ItemCounterWidget(onChange: (value) {
          Get.find<CartListController>().updateQuantity(
              product.id, value);
        })
      ],
    );
  }
}
