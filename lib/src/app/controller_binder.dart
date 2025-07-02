import 'package:craftybay/src/core/routes/app_route_names.dart';
import 'package:craftybay/src/core/services/network/network_client.dart';
import 'package:craftybay/src/features/presentation/controller/authentication_controllers/auth_controller.dart';
import 'package:craftybay/src/features/presentation/controller/user_controllers/home_slider_controller.dart';
import 'package:get/get.dart';

import '../features/presentation/controller/authentication_controllers/otp_verification_controller.dart';
import '../features/presentation/controller/authentication_controllers/show_password_controller.dart';
import '../features/presentation/controller/authentication_controllers/sign_in_controller.dart';
import '../features/presentation/controller/authentication_controllers/sign_up_controller.dart';
import '../features/presentation/controller/splash_controller/splash_controller.dart';
import '../features/presentation/controller/user_controllers/category_list_controller.dart';
import '../features/presentation/controller/user_controllers/color_picker_controller.dart';
import '../features/presentation/controller/user_controllers/home_nav_controller.dart';
import '../features/presentation/controller/user_controllers/item_counter_controller.dart';
import '../features/presentation/controller/user_controllers/main_bottom_nav_bar_controller.dart';
import '../features/presentation/controller/user_controllers/product_screen_controller.dart';
import '../features/presentation/controller/user_controllers/review_screen_controller.dart';
import '../features/presentation/controller/user_controllers/size_picker_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(SignInController());
    Get.put(ShowPasswordController());
    Get.put(SignUpController());
    Get.put(OtpVerificationController());
    Get.put(AuthController());
    Get.put(MainBottomNavController());
    Get.put(HomeNavController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ColorPickerController());
    Get.put(SizePickerController());
    Get.put(ProductScreenController());
    Get.put(ReviewScreenController());
    for (int i = 0; i < 10; i++) {
      Get.lazyPut<ItemCounterController>(
        () => ItemCounterController(initialValue: 1),
        tag: 'cart_item_$i',
        fenix: true,
      );
    }
    Get.put(NetworkClient(onUnauthorized: _onUnauthorized, headers: _headers()));
  }

  void _onUnauthorized() {
    Get.find<AuthController>().clearUserData();
    Get.toNamed(AppRoutesName.signIn);
  }

  Map<String, String> _headers() {
    return {
      'content-Type': 'application/json',
      'access-token': Get.find<AuthController>().accessToken ?? '',
    };
  }
}
