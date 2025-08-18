import 'package:craftybay/src/core/utils/urls.dart';
import 'package:get/get.dart';

import '../../../../core/services/network/network_client.dart';

class DeleteCartItemController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> deleteCartItem(String id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().deleteRequest(url: AppUrls.deleteCartItemByIdUrl(id));
    if (response.isSuccessful) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}