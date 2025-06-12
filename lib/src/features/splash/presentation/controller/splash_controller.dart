import 'package:get/get.dart';

import '../../../../core/routes/app_route_names.dart';

class SplashController  extends GetxController {

  Future<void> moveToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(AppRoutesName.parent);
  }

}