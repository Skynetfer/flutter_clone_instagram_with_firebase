import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clone_intagram/blocs/auth/auth_bloc.dart';
import 'package:flutter_clone_intagram/screens/nav/nav_screen.dart';
import 'package:flutter_clone_intagram/screens/signIn/sign_in_screen.dart';
import 'package:flutter_clone_intagram/screens/signup/sign_up_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state);
          if (state.status == AuthStatus.unauthenticated) {
            Navigator.of(context).pushNamed(SignInScreen.routeName);
          } else if (state.status == AuthStatus.authenticated) {
            Navigator.of(context).pushNamed(NavScreen.routeName);
          }
        },
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
