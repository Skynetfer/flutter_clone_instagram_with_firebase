import 'package:flutter/material.dart';
import 'package:flutter_clone_intagram/screens/nav/nav_screen.dart';
import 'package:flutter_clone_intagram/screens/signIn/sign_in_screen.dart';
import 'package:flutter_clone_intagram/screens/signup/sign_up_screen.dart';
import 'package:flutter_clone_intagram/screens/splash/splash_screen.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print("Router: ${settings.name}");
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/'),
            builder: (_) => const Scaffold());
      case SplashScreen.routeName:
        return SplashScreen.route();
      case SignInScreen.routeName:
        return SignInScreen.route();
      case SignUpScreen.routeName:
        return SignUpScreen.route();
      case NavScreen.routeName:
        return NavScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text(
            'Something went wrong',
          ),
        ),
      ),
    );
  }
}
