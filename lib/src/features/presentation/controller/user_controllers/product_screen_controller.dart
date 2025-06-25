import 'package:get/get.dart';

import '../../../../core/routes/app_route_names.dart';

class ProductScreenController extends GetxController {
  void gotoReview() {
    Get.toNamed(AppRoutesName.reviews);
  }
  void gotoParentScreen() {
    Get.toNamed(AppRoutesName.parent);
  }
}