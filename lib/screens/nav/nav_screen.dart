import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  static const String routeName = "/nav";
  static Route route() {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => NavScreen(),
        settings: RouteSettings(name: routeName),
        transitionDuration: Duration(seconds: 0));
  }

  const NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Nav Screen"),
    );
  }
}
