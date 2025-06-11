import 'package:get/get.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/routes/app_route_names.dart';

class HomeNavController extends GetxController {
  void gotoPopular() {
    Get.toNamed(AppRoutesName.productList, arguments: AppStrings.popular);
  }
  void gotoSpecial() {
    Get.toNamed(AppRoutesName.productList, arguments: AppStrings.special);
  }
  void gotoNewArrivals() {
    Get.toNamed(AppRoutesName.productList, arguments: AppStrings.newArrivals);
  }
}