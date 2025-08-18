import 'package:get/get.dart';

import '../../../../core/services/network/network_client.dart';
import '../../../../core/utils/urls.dart';
import '../../../data/models/product_model.dart';

class ProductDetailsController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  late ProductModel _productDetails;
  ProductModel get productDetails => _productDetails;

  Future<bool> getProductDetails(String id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    try {
      NetworkResponse response = await Get.find<NetworkClient>().getRequest(
        url: AppUrls.getProductDetailsByIdUrl(id),
      );
      if (response.isSuccessful) {
        _productDetails = ProductModel.fromJson(response.responseData!['data']);
        isSuccess = true;
        _errorMessage = null;
      } else {
        _errorMessage = response.errorMessage!;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _inProgress = false;
      update();
    }
    return isSuccess;
  }
}