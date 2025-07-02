import 'package:craftybay/src/features/data/models/verify_otp_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/routes/app_route_names.dart';
import '../../../../../core/utils/snack_bar_message.dart';
import '../../../controller/authentication_controllers/otp_verification_controller.dart';
import '../common_widgets/app_logo_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinTEController.dispose();
    super.dispose();
  }

  Future<void> _onTapVerifyOtp() async {
    if (_formKey.currentState!.validate()) {
      VerifyOtpRequestModel model = VerifyOtpRequestModel(
        otp: _pinTEController.text.trim(),
        email: widget.email,
      );
      final bool isSuccess = await Get.find<OtpVerificationController>().onSubmit(model);
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.parent, (predicate) => false);
      } else {
        showSnackBarMessage(context, Get.find<OtpVerificationController>().errorMessage!, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogoWidget(
                      height: AppSpacing.screenHeight(context) * 0.1,
                      width: AppSpacing.screenWidth(context) * 0.1,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    Text(AppStrings.verifyOtp, style: textTheme.headlineMedium),
                    Text(
                      "${AppStrings.verifyOtpMessage} ${widget.email}",
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.03),
                    PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      separatorBuilder: (c, index) => const SizedBox(width: 10),
                      cursorColor: AppColor.primaryColor,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 45,
                        activeColor: AppColor.primaryColor,
                        inactiveColor: AppColor.greyColor,
                        selectedColor: AppColor.secondaryColor,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: AppColor.transparentColor,
                      controller: _pinTEController,
                      appContext: context,
                      autoFocus: true,
                      validator: (String? value) {
                        String pin = value?.trim() ?? '';
                        final RegExp pinRegex = RegExp(r'^\d{4}$');
                        if (pinRegex.hasMatch(pin) == false) {
                          return 'Please enter valid Pin';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.05),
                    GetBuilder<OtpVerificationController>(
                      builder: (controller) {
                        return Visibility(
                          visible: controller.otpVerificationInProgress == false,
                          replacement: Center(child: const CircularProgressIndicator()),
                          child: ElevatedButton(
                            onPressed: _onTapVerifyOtp,
                            child: Text(AppStrings.submit),
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
