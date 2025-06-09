import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/app/app_spacing.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/images.dart';
import '../../../../../../../core/constants/strings.dart';
import '../../../../common_widget/custom_app_bar.dart';

class ProductPreviewWidget extends StatelessWidget {
  const ProductPreviewWidget({
    super.key,
    required ValueNotifier<int> currentSlider,
  }) : _currentSlider = currentSlider;

  final ValueNotifier<int> _currentSlider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.screenHeight(context) * 0.3,
      width: AppSpacing.screenWidth(context),
      color: AppColor.lightGreyColor,
      child: Column(
        children: [
          CustomAppBar(
            title: AppStrings.productDetails,
            backgroundColor: AppColor.transparentColor,
            onTap: () {
              Get.back();
            },
          ),
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: AppSpacing.screenHeight(context) * 0.22,
                  viewportFraction: 1,
                  onPageChanged: (int currentIndex, _) {
                    _currentSlider.value = currentIndex;
                  },
                ),
                items:
                [1, 2, 3, 4].map((i) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        width: AppSpacing.screenWidth(context),
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        color: AppColor.lightGreyColor,
                        child: Image.asset(AppImages.shoeLogoPng),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ValueListenableBuilder(
                  valueListenable: _currentSlider,
                  builder: (context, index, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 4; i++)
                          Container(
                            width: AppSpacing.screenWidth(context) * 0.03,
                            height: AppSpacing.screenWidth(context) * 0.03,
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == i ? AppColor.themeColor : AppColor.whiteColor,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}