import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../../../app/app_spacing.dart';
import '../../../../../../../core/constants/colors.dart';
import 'special_deals_banner_widget.dart';

class HomeCarouselSliderWidget extends StatefulWidget {
  const HomeCarouselSliderWidget({super.key});

  @override
  State<HomeCarouselSliderWidget> createState() =>
      _HomeCarouselSliderWidgetState();
}

class _HomeCarouselSliderWidgetState extends State<HomeCarouselSliderWidget> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: AppSpacing.screenHeight(context) * 0.185,
            viewportFraction: 1,
            onPageChanged: (int currentIndex, _) {
              _currentSlider.value = currentIndex;
            },
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
          ),
          items:
              [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (context) {
                    return Container(
                      width: AppSpacing.screenWidth(context),
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: AppColor.themeColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: SpecialDealsBannerWidget(),
                    );
                  },
                );
              }).toList(),
        ),
        SizedBox(height: AppSpacing.screenHeight(context) * 0.012),
        ValueListenableBuilder(
          valueListenable: _currentSlider,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: AppSpacing.screenWidth(context) * 0.03,
                    height: AppSpacing.screenWidth(context) * 0.03,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: index == i ? AppColor.themeColor : null,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
