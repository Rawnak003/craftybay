import 'package:get/get.dart';

import '../../../../core/routes/app_route_names.dart';

class SignInController extends GetxController {
  void onTapSignUp() {
    Get.toNamed(AppRoutesName.signUp);
  }
}