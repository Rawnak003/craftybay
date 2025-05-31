import 'package:flutter/material.dart';
import '../../src/features/authentication/presentation/views/sign_in_screen.dart';
import '../../src/features/authentication/presentation/views/sign_up_screen.dart';
import '../../src/features/onboarding/presentation/views/home_screen.dart';
import '../../src/features/onboarding/presentation/views/parent_screen.dart';
import '../../src/features/splash/presentation/view/splash_screen.dart';
import 'app_route_names.dart';

class AppRouteConfigs {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRoutesName.signIn:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case AppRoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case AppRoutesName.parent:
        return MaterialPageRoute(
          builder: (context) => const ParentScreen(),
        );
      case AppRoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
