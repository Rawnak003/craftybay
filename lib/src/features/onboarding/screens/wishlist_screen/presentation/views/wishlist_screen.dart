import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../common_widget/custom_app_bar.dart';
import '../../../../common_widget/product_item_card_widget.dart';
import '../../../parent_screen/presentation/controller/main_bottom_nav_bar_controller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding, vertical: AppSpacing.verticalPadding),
          child: GridView.builder(
            itemCount: 30,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.7,
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
