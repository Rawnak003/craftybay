import 'package:flutter/material.dart';
import '../../features/presentation/views/authentication/screens/otp_verify_screen.dart';
import '../../features/presentation/views/authentication/screens/sign_in_screen.dart';
import '../../features/presentation/views/authentication/screens/sign_up_screen.dart';
import '../../features/presentation/views/splash/splash_screen.dart';
import '../../features/presentation/views/user/screens/create_review_screen/create_review_screen.dart';
import '../../features/presentation/views/user/screens/parent_screen/main_bottom_nav_bar_screen.dart';
import '../../features/presentation/views/user/screens/product_details_screen/product_details_screen.dart';
import '../../features/presentation/views/user/screens/product_list_screen/product_list_screen.dart';
import '../../features/presentation/views/user/screens/review_screen/review_screen.dart';
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
      case AppRoutesName.verifyOtp:
        final String email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => OtpVerificationScreen(email: email,),
        );
      case AppRoutesName.parent:
        return MaterialPageRoute(
          builder: (context) => MainBottomNavBarScreen(),
        );
      case AppRoutesName.productList:
        final categoryTitle = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ProductListScreen(categoryTitle: categoryTitle),
        );
      case AppRoutesName.productDetails:
        final productId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(productId: productId,),
        );
      case AppRoutesName.reviews:
        return MaterialPageRoute(
          builder: (context) => ReviewScreen(),
        );
      case AppRoutesName.createReviews:
        return MaterialPageRoute(
          builder: (context) => CreateReviewScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
