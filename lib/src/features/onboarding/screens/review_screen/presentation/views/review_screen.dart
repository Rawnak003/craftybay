import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../common_widget/custom_app_bar.dart';
import '../../../../common_widget/custom_bottom_button.dart';
import '../../data/static data/static_reviews.dart';
import '../widgets/review_card_widget.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.reviews,
          onTap: () {
            Get.back();
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.pagePadding),
                itemCount: staticReviews.length,
                itemBuilder: (context, index) {
                  final review = staticReviews[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.pagePadding),
                    child: ReviewCardWidget(
                      name: review.name,
                      reviewText: review.text,
                    ),
                  );
                },
              ),
            ),
            CustomBottomButton(
              title: 'Reviews(1000)',
              button: SizedBox(
                width: AppSpacing.screenWidth(context) * 0.1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.themeColor,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
