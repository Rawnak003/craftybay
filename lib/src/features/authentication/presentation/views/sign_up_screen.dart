import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/app/app_spacing.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/routes/app_route_names.dart';
import '../../../../core/utils/input_validators.dart';
import '../widgets/app_logo_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onTapSignIn() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutesName.signIn,
          (pre) => false,
    );
  }

  void _onTapSignUp() {
    if (_formKey.currentState!.validate()) {
      // TODO: implement sign in
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutesName.signIn,
            (pre) => false,
      );
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneTEController.dispose();
    _addressTEController.dispose();
    _cityController.dispose();
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
                    Text(AppStrings.signUp, style: textTheme.headlineMedium),
                    Text(AppStrings.signUpInstruction, style: textTheme.titleMedium,),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.03),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: AppStrings.email,
                        hintText: AppStrings.emailHint,
                        prefixIcon: Icon(Icons.email, color: AppColor.secondaryColor),
                      ),
                      validator: InputValidators.emailValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    TextFormField(
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: AppStrings.firstName,
                        hintText: AppStrings.firstNameHint,
                        prefixIcon: Icon(Icons.person, color: AppColor.secondaryColor),
                      ),
                      validator: (value) => InputValidators.nameValidator('first Name', value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    TextFormField(
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: AppStrings.lastName,
                        hintText: AppStrings.lastNameHint,
                        prefixIcon: Icon(Icons.person, color: AppColor.secondaryColor),
                      ),
                      validator: (value) => InputValidators.nameValidator('last Name', value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    TextFormField(
                      controller: _phoneTEController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: AppStrings.phone,
                        hintText: AppStrings.phoneHint,
                        prefixIcon: Icon(Icons.phone, color: AppColor.secondaryColor),
                      ),
                      validator: InputValidators.phoneValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    TextFormField(
                      controller: _cityController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: AppStrings.city,
                        hintText: AppStrings.cityHint,
                        prefixIcon: Icon(Icons.location_city_outlined, color: AppColor.secondaryColor),
                      ),
                      validator: (value) => InputValidators.nameValidator('city', value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    TextFormField(
                      controller: _addressTEController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      maxLines: 2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        labelText: AppStrings.address,
                        hintText: AppStrings.addressHint,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Icon(Icons.location_on, color: AppColor.secondaryColor),
                        ),
                      ),
                      validator: (value) => InputValidators.nameValidator('shipping address', value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    TextFormField(
                      controller: _passwordTEController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: AppStrings.password,
                        hintText: AppStrings.passwordHint,
                        prefixIcon: Icon(Icons.lock, color: AppColor.secondaryColor),
                      ),
                      validator: InputValidators.passwordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    ElevatedButton(
                      onPressed: _onTapSignUp,
                      child: Text(
                        AppStrings.signUp,
                      ),
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.04),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.alreadyHaveAccount,
                            style: textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: AppStrings.signIn,
                            style: textTheme.bodyLarge?.copyWith(
                              color: AppColor.themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                            TapGestureRecognizer()
                              ..onTap = () => _onTapSignIn(),
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
