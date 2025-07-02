import 'package:craftybay/src/core/utils/urls.dart';
import 'package:craftybay/src/features/data/models/verify_otp_request_model.dart';
import 'package:get/get.dart';

import '../../../../core/services/network/network_client.dart';
import '../../../data/models/user_model.dart';
import 'auth_controller.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationInProgress = false;
  bool get otpVerificationInProgress => _otpVerificationInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> onSubmit(VerifyOtpRequestModel model) async {
    bool isSuccess = false;
    _otpVerificationInProgress = true;
    update();
    try {
      NetworkResponse response = await Get.find<NetworkClient>().postRequest(
        url: AppUrls.otpVerifyUrl,
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
      _otpVerificationInProgress = false;
      update();
    }
    return isSuccess;
  }
}
