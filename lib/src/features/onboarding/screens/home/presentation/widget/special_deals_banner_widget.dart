import 'package:flutter/material.dart';

import '../../../../../../../core/app/app_spacing.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/images.dart';

class SpecialDealsBannerWidget extends StatelessWidget {
  const SpecialDealsBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(AppImages.shoeLogoPng, fit: BoxFit.contain),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText(context, 'Happy New Year'),
                _buildText(context, 'Special Deal'),
                _buildText(context, 'Save 30%'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(
                      AppSpacing.screenWidth(context) * 0.3,
                    ),
                    backgroundColor: AppColor.whiteColor,
                    foregroundColor: AppColor.themeColor,
                    padding: EdgeInsets.symmetric(vertical: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Buy Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _buildText(BuildContext context, String textLine) {
    return Text(
      textLine,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
