import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_spacing.dart';
import '../../../../core/constants/strings.dart';
import '../authentication/common_widgets/app_logo_widget.dart';
import '../../controller/splash_controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<SplashController>().moveToHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Spacer(),
              AppLogoWidget(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.03),
              Text(
                AppStrings.version,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
