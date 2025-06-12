import 'package:craftybay/src/core/app/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/utils/input_validators.dart';
import '../../../../common_widget/custom_app_bar.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onTapSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: implement submit
      Get.back();
    }
  }
  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _reviewTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: AppStrings.createReview, onTap: (){Get.back();}),
        body: Padding(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstNameTEController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: AppStrings.firstNameHint,
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
                      hintText: AppStrings.lastNameHint,
                    ),
                    validator: (value) => InputValidators.nameValidator('last Name', value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                  TextFormField(
                    controller: _reviewTEController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: AppStrings.yourReview,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    validator: (value) => InputValidators.nameValidator('your review', value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.04),
                  ElevatedButton(
                    onPressed: _onTapSubmit,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
