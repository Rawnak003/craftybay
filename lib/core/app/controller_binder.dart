import 'package:get/get.dart';
import '../../src/features/onboarding/screens/home/controller/home_nav_controller.dart';
import '../../src/features/onboarding/screens/parent_screen/controller/main_bottom_nav_bar_controller.dart';
import '../../src/features/onboarding/screens/product_screen/controller/color_picker_controller.dart';
import '../../src/features/onboarding/screens/product_screen/controller/size_picker_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(HomeNavController());
    Get.put(ColorPickerController());
    Get.put(SizePickerController());
  }
}