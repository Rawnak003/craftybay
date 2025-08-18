import 'package:get/get.dart';
import '../../../../core/routes/app_route_names.dart';
import '../authentication_controllers/auth_controller.dart';

class SplashController extends GetxController {
  Future<void> moveToHomeScreen() async {
    bool isLoggedIn = await Get.find<AuthController>().isUserLoggedIn();

    await Future.delayed(const Duration(seconds: 3));

    if (isLoggedIn) {
      Get.offAndToNamed(AppRoutesName.parent);
    } else {
      Get.offAndToNamed(AppRoutesName.signIn);
    }
  }
}
