import 'package:craftybay/src/features/data/models/category_model.dart';
import 'package:get/get.dart';

import '../../../../core/services/network/network_client.dart';
import '../../../../core/utils/urls.dart';

class CategoryListController extends GetxController{
  final int _count = 30;
  int get count => _count;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  int? _lastPage;

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  bool _initialLoadingInProgress = false;
  bool get initialLoadingInProgress => _initialLoadingInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int get homeCategoryItemLength => _categoryList.length > 10 ? 10 : _categoryList.length;

  final List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  Future<void> getCategories() async {
    _currentPage++;

    if (_lastPage != null && _lastPage! < _currentPage) {
      return;
    }

    if (_currentPage == 1) {
      _categoryList.clear();
      _initialLoadingInProgress = true;
    } else {
      _inProgress = true;
    }
    update();
    try {
      final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
        url: AppUrls.getCategoriesUrl(_count, _currentPage),
      );
      if (response.isSuccessful) {
        _lastPage = response.responseData!['data']['last_page'] ?? 0;
        List<CategoryModel> list = [];
        for (Map<String, dynamic> map
        in response.responseData!['data']['results']) {
          list.add(CategoryModel.fromJson(map));
        }
        _categoryList.addAll(list);
        _errorMessage = null;
      } else {
        _errorMessage = response.errorMessage!;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      if (_currentPage == 1) {
        _initialLoadingInProgress = false;
      } else {
        _inProgress = false;
      }
      update();
    }
  }
}