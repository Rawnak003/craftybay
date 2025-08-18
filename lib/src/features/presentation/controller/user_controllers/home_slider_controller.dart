import 'package:craftybay/src/features/data/models/slider_model.dart';
import 'package:get/get.dart';

import '../../../../core/services/network/network_client.dart';
import '../../../../core/utils/urls.dart';

class HomeSliderController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<ProductModel> _sliderList = [];
  List<ProductModel> get sliderList => _sliderList;

  Future<bool> getHomeSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    try {
      NetworkResponse response = await Get.find<NetworkClient>().getRequest(
        url: AppUrls.getSliderUrl,
      );
      if (response.isSuccessful) {
        List<ProductModel> list = [];
        for (Map<String, dynamic> map in response.responseData!['data']['results']) {
          list.add(ProductModel.fromJson(map));
        }
        _sliderList = list;
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