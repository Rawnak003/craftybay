import 'package:get/get.dart';

class SizePickerController extends GetxController {
  final List<String> sizeOptions = ['S', 'M', 'L', 'XL'];

  var selectedIndex = 0.obs;

  void selectSize(int index) {
    selectedIndex.value = index;
  }
}
