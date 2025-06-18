import 'package:craftybay/src/core/app/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/strings.dart';
import '../../../../common_widget/custom_app_bar.dart';
import '../../../../common_widget/custom_bottom_button.dart';
import '../../../parent_screen/presentation/controller/main_bottom_nav_bar_controller.dart';
import '../widget/custom_cart_product_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.cart,
          onTap: () {
            Get.find<MainBottomNavController>().backToHome();
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.pagePadding,
                ),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CustomCartProductWidget(id: 'cart_item_$index');
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 4);
                  },
                ),
              ),
            ),
            _buildPriceAndCheckOutSection(context),
          ],
        ),
      ),
    );
  }

  CustomBottomButton _buildPriceAndCheckOutSection(BuildContext context) {
    return CustomBottomButton(
      title: 'Total Price',
      subtext: '\$ 10000',
      button: SizedBox(
        width: AppSpacing.screenWidth(context) * 0.3,
        child: ElevatedButton(
          onPressed: () {}, //TODO: Add functionality to checkout
          child: Text(AppStrings.checkout),
        ),
      ),
    );
  }
}
