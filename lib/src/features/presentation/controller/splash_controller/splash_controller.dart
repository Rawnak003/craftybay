import 'package:get/get.dart';

import '../../../../core/routes/app_route_names.dart';
import '../authentication_controllers/auth_controller.dart';

class SplashController  extends GetxController {
  Future<void> moveToHomeScreen() async {
    await Get.find<AuthController>().isLoggedIn();
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(AppRoutesName.signIn);
  }
}