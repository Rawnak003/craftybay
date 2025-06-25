import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/utils/input_validators.dart';
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
  bool obscurePassword = true;

  void _onTapSignIn() {
    if (_formKey.currentState!.validate()) {
      // TODO: implement sign in
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
                    ElevatedButton(
                      onPressed: _onTapSignIn,
                      child: Text(AppStrings.signIn),
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
                                  ..onTap = () => Get.find<SignInController>().onTapSignUp(),
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
