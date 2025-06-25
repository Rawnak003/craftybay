import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings.dart';
import '../../common_widget/custom_app_bar.dart';
import '../../common_widget/custom_bottom_button.dart';
import '../../../../../data/static_data/static_reviews.dart';
import '../../../../controller/user_controllers/review_screen_controller.dart';
import 'widgets/review_card_widget.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.reviews,
        onTap: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Column(
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
                  onPressed: Get.find<ReviewScreenController>().gotoCreateReview,
                  child: Icon(Icons.add, size: 24,),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
