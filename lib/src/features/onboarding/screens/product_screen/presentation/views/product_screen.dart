import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/routes/app_route_names.dart';
import '../../../../common_widget/custom_action_button.dart';
import '../../../../common_widget/custom_bottom_button.dart';
import '../../../../common_widget/item_counter_widget.dart';
import '../widgets/color_picker_widget.dart';
import '../widgets/product_preview_widget.dart';
import '../widgets/size_picker_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ProductPreviewWidget(currentSlider: _currentSlider),
            SizedBox(
              height: AppSpacing.screenHeight(context) * 0.55,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.pagePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeadingRow(context),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      Text(AppStrings.color, style: Theme.of(context,).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      ColorPickerWidget(),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      Text(AppStrings.size, style: Theme.of(context,).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      SizePickerWidget(),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      Text(AppStrings.description, style: Theme.of(context,).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
                      Text(AppStrings.shoeDescription, textAlign: TextAlign.justify),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomBottomButton(
              title: 'Price',
              subtext: '\$ 1000',
              button: ElevatedButton(
                onPressed: () {},
                child: Text(AppStrings.addToCart),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadingRow(BuildContext context) {
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
                  'Nike Air Max 270',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context,).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColor.yellowColor, size: 20),
                    SizedBox(width: AppSpacing.screenWidth(context) * 0.005),
                    Text(
                      '4.5', style: Theme.of(context,).textTheme.titleMedium?.copyWith(fontSize: 18),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutesName.reviews);
                      },
                      child: Text(
                        AppStrings.reviews, style: Theme.of(context,).textTheme.titleMedium?.copyWith(fontSize: 18, color: AppColor.themeColor,),
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
        ItemCounterWidget(),
      ],
    );
  }
}