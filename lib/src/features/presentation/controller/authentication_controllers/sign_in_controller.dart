import 'package:craftybay/src/features/data/models/sign_in_request_model.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/services/network/network_client.dart';
import '../../../../core/utils/urls.dart';
import '../../../data/models/user_model.dart';
import 'auth_controller.dart';

class SignInController extends GetxController {
  bool _signInInProgress = false;
  bool get signInInProgress => _signInInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> onSignIn(SignInRequestModel model) async {
    bool isSuccess = false;
    _signInInProgress = true;
    update();
    try {
      NetworkResponse response = await Get.find<NetworkClient>().postRequest(
        url: AppUrls.signInUrl,
        body: model.toJson(),
      );
      if (response.isSuccessful) {
        await Get.find<AuthController>().saveUserData(
          UserModel.fromJson(response.responseData!['data']['user']),
          response.responseData!['data']['token'],
        );
        isSuccess = true;
        _errorMessage = null;
      } else {
        _errorMessage = response.errorMessage!;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _signInInProgress = false;
      update();
    }
    return isSuccess;
  }

  void onTapSignUp() {
    Get.toNamed(AppRoutesName.signUp);
  }
}