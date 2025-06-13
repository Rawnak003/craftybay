import 'package:get/get.dart';

class ShowPasswordController extends GetxController {
  bool _showConfirmPassword = false;

  bool get showConfirmPassword => _showConfirmPassword;

  void toggleConfirmPassword() {
    _showConfirmPassword = !_showConfirmPassword;
    update();
  }
}