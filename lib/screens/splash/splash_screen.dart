import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routerName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routerName),
      builder: (_) => SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
