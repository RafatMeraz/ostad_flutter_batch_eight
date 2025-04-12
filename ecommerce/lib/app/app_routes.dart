import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:ecommerce/features/products/ui/screens/product_details_screen.dart';
import 'package:ecommerce/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    } else if (settings.name == SignInScreen.name) {
      route = const SignInScreen();
    } else if (settings.name == SignUpScreen.name) {
      route = const SignUpScreen();
    } else if (settings.name == VerifyOtpScreen.name) {
      String email = settings.arguments as String;
      route = VerifyOtpScreen(email: email);
    } else if (settings.name == MainBottomNavBarScreen.name) {
      route = const MainBottomNavBarScreen();
    } else if (settings.name == ProductListScreen.name) {
      final String category = settings.arguments as String;
      route = ProductListScreen(category: category);
    } else if (settings.name == ProductDetailsScreen.name) {
      route = const ProductDetailsScreen();
    }

    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
