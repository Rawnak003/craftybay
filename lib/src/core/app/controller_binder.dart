import 'package:get/get.dart';
import '../../features/authentication/screens/sign_in_screen/presentation/controllers/show_password_controller.dart';
import '../../features/authentication/screens/sign_in_screen/presentation/controllers/sign_in_controller.dart';
import '../../features/authentication/screens/sign_up_screen/presentation/controllers/sign_up_controller.dart';
import '../../features/onboarding/screens/home_screen/presentation/controller/home_nav_controller.dart';
import '../../features/onboarding/screens/parent_screen/presentation/controller/main_bottom_nav_bar_controller.dart';
import '../../features/onboarding/screens/product_screen/presentation/controller/color_picker_controller.dart';
import '../../features/onboarding/screens/product_screen/presentation/controller/product_screen_controller.dart';
import '../../features/onboarding/screens/product_screen/presentation/controller/size_picker_controller.dart';
import '../../features/onboarding/screens/review_screen/presentation/controller/review_screen_controller.dart';
import '../../features/splash/presentation/controller/splash_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(SignInController());
    Get.put(ShowPasswordController());
    Get.put(SignUpController());
    Get.put(MainBottomNavController());
    Get.put(HomeNavController());
    Get.put(ColorPickerController());
    Get.put(SizePickerController());
    Get.put(ProductScreenController());
    Get.put(ReviewScreenController());

  }
}