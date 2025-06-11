import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app/app_spacing.dart';
import '../../../../core/routes/app_route_names.dart';
import '../../../authentication/presentation/widgets/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToHomeScreen();
  }

  Future<void> _moveToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(AppRoutesName.parent);
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
                'Version 1.0.0',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
