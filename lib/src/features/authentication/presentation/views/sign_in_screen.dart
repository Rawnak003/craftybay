import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/routes/app_route_names.dart';
import '../../../../../core/utils/input_validators.dart';
import '../widgets/app_logo_widget.dart';

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

  void _onTapSignUp() {
    Navigator.pushNamed(context, AppRoutesName.signUp);
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
                    Text(
                      AppStrings.signInInstruction,
                      style: textTheme.titleMedium,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.03),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: AppStrings.email,
                        hintText: AppStrings.emailHint,
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColor.secondaryColor,
                        ),
                      ),
                      validator: InputValidators.emailValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: obscurePassword,
                      obscuringCharacter: '*',
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: AppStrings.password,
                        hintText: AppStrings.passwordHint,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColor.secondaryColor,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off_outlined,
                            color:
                                obscurePassword
                                    ? AppColor.secondaryColor
                                    : AppColor.greyColor,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: InputValidators.passwordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
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
                                  ..onTap = () => _onTapSignUp(),
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
