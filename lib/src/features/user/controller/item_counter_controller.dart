import 'package:get/get.dart';

class ItemCounterController extends GetxController {
  RxInt value;

  ItemCounterController({required int initialValue}) : value = initialValue.obs;

  void increment() {
    if (value < 20) value++;
  }

  void decrement() {
    if (value > 1) value--;
  }
}
