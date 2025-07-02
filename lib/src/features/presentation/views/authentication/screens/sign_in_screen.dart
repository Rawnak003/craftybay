import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/routes/app_route_names.dart';
import '../../../../../core/utils/input_validators.dart';
import '../../../../../core/utils/snack_bar_message.dart';
import '../../../../data/models/sign_in_request_model.dart';
import '../common_widgets/app_logo_widget.dart';
import '../../../controller/authentication_controllers/show_password_controller.dart';
import '../../../controller/authentication_controllers/sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _signInController = Get.find<SignInController>();
  bool obscurePassword = true;

  Future<void> _onTapSignIn() async {
    if (_formKey.currentState!.validate()) {
      SignInRequestModel model = SignInRequestModel(
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
      );
      final bool isSuccess = await _signInController.onSignIn(model);
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.parent, (predicate) => false);
      } else {
        showSnackBarMessage(context, _signInController.errorMessage!, true);
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
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
                    Text(AppStrings.signIn, style: textTheme.headlineMedium),
                    Text(AppStrings.signInInstruction, style: textTheme.titleMedium,),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.03),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: AppStrings.email,
                        hintText: AppStrings.emailHint,
                        prefixIcon: Icon(Icons.email,),
                      ),
                      validator: InputValidators.emailValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    GetBuilder<ShowPasswordController>(
                      builder: (controller) {
                        return TextFormField(
                          controller: _passwordTEController,
                          obscureText: !controller.showConfirmPassword,
                          obscuringCharacter: '*',
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: AppStrings.password,
                            hintText: AppStrings.passwordHint,
                            prefixIcon: Icon(Icons.lock,),
                            suffixIcon: IconButton(
                              icon: Icon(controller.showConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off_outlined,
                                color: controller.showConfirmPassword
                                        ? AppColor.secondaryColor
                                        : AppColor.greyColor,
                              ),
                              onPressed: controller.toggleConfirmPassword,
                            ),
                          ),
                          validator: InputValidators.passwordValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        );
                      }
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {}, //TODO: implement forgot password
                        child: Text(
                          AppStrings.forgotPassword,
                          style: textTheme.bodyLarge?.copyWith(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    GetBuilder<SignInController>(
                      builder: (controller) {
                        return Visibility(
                          visible: controller.signInInProgress == false,
                          replacement: Center(child: const CircularProgressIndicator()),
                          child: ElevatedButton(
                            onPressed: _onTapSignIn,
                            child: Text(AppStrings.signIn),
                          ),
                        );
                      }
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.05),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.dontHaveAccount,
                            style: textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: AppStrings.signUp,
                            style: textTheme.bodyLarge?.copyWith(
                              color: AppColor.themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () => _signInController.onTapSignUp(),
                          ),
                        ],
                      ),
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
