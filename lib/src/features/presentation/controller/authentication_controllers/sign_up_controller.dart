import 'package:get/get.dart';

import '../../../../core/routes/app_route_names.dart';

class SignUpController extends GetxController {
  void onTapSignIn() {
    Get.offAllNamed(AppRoutesName.signIn);
  }
}