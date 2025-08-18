import 'package:get/get.dart';

import '../../../../core/routes/app_route_names.dart';

class ReviewScreenController extends GetxController {
  void gotoCreateReview() {
    Get.toNamed(AppRoutesName.createReviews);
  }
}