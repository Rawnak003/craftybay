import 'package:get/get.dart';
import '../../src/features/onboarding/screens/parent_screen/controller/main_bottom_nav_bar_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}