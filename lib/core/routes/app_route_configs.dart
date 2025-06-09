import 'package:flutter/material.dart';
import '../../src/features/authentication/presentation/views/sign_in_screen.dart';
import '../../src/features/authentication/presentation/views/sign_up_screen.dart';
import '../../src/features/onboarding/screens/parent_screen/presentation/views/main_bottom_nav_bar_screen.dart';
import '../../src/features/onboarding/screens/product_list_screen/presentation/product_list_screen.dart';
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
          builder: (context) => const MainBottomNavBarScreen(),
        );
      case AppRoutesName.productList:
        final categoryTitle = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ProductListScreen(categoryTitle: categoryTitle),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
