import 'package:get/get.dart';

import '../../../../core/services/network/network_client.dart';
import '../../../../core/utils/urls.dart';
import '../../../data/models/product_model.dart';

class NewProductController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  Future<bool> getNewProduct() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    try {
      NetworkResponse response = await Get.find<NetworkClient>().getRequest(
        url: AppUrls.getProductsByTagUrl('New'),
      );
      if (response.isSuccessful) {
        List<ProductModel> list = [];
        for (Map<String, dynamic> map in response.responseData!['data']['results']) {
          list.add(ProductModel.fromJson(map));
        }
        _productList = list;
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