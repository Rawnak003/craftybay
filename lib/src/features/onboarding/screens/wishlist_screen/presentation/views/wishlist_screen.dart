import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/app/app_spacing.dart';
import '../../../../../../../core/constants/strings.dart';
import '../../../../common_widget/custom_app_bar.dart';
import '../../../../common_widget/product_item_card_widget.dart';
import '../../../parent_screen/controller/main_bottom_nav_bar_controller.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: CustomAppBar(title: AppStrings.wishlist, onTap: () {
          Get.find<MainBottomNavController>().backToHome();
        },),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding * 0.5, vertical: AppSpacing.verticalPadding),
          child: GridView.builder(
            itemCount: 30,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: ProductItemCardWidget());
            },
          ),
        ),
      ),
    );
  }
}
