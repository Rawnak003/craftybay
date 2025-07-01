import 'package:craftybay/src/core/utils/urls.dart';
import 'package:craftybay/src/features/data/models/sign_up_request_model.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/services/network/network_client.dart';

class SignUpController extends GetxController {
  bool _signUpInProgress = false;
  bool get signUpInProgress => _signUpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  late String _message;
  String get message => _message;

  Future<bool> onSignUp(SignUpRequestModel model) async {
    bool isSuccess = false;
    _signUpInProgress = true;
    update();
    try {
      NetworkResponse response = await Get.find<NetworkClient>().postRequest(
        url: AppUrls.signUpUrl,
        body: model.toJson(),
      );
      if (response.isSuccessful) {
        _message = response.responseData!['msg'];
        isSuccess = true;
        _errorMessage = null;
      } else {
        _errorMessage = response.errorMessage!;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _signUpInProgress = false;
      update();
    }
    return isSuccess;
  }

  void onTapSignIn() {
    Get.offAllNamed(AppRoutesName.signIn);
  }
}
