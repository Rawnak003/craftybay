import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../controller/user_controllers/product_screen_controller.dart';
import '../../common_widget/custom_bottom_button.dart';
import '../../../../controller/user_controllers/main_bottom_nav_bar_controller.dart';
import 'widgets/color_picker_widget.dart';
import 'widgets/custom_header_widget.dart';
import 'widgets/product_preview_widget.dart';
import 'widgets/size_picker_widget.dart';
class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  final ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProductPreviewWidget(currentSlider: _currentSlider),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.pagePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomHeaderWidget(id: productId),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      Text(
                        AppStrings.color,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      ColorPickerWidget(),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      Text(
                        AppStrings.size,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      SizePickerWidget(),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      Text(
                        AppStrings.description,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      Text(
                        AppStrings.shoeDescription,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildPriceAndAddToCartSection(context),
          ],
        ),
      ),
    );
  }

  CustomBottomButton _buildPriceAndAddToCartSection(BuildContext context) {
    final MainBottomNavController mainBottomNavController = Get.find<MainBottomNavController>();
    final ProductScreenController productDetailsController = Get.find<ProductScreenController>();
    return CustomBottomButton(
      title: 'Price',
      subtext: '\$ 1000',
      button: SizedBox(
        width: AppSpacing.screenWidth(context) * 0.3,
        child: ElevatedButton(
          onPressed: () {
            productDetailsController.gotoParentScreen();
            mainBottomNavController.moveToCart();
          },
          child: Text(AppStrings.addToCart),
        ),
      ),
    );
  }
}