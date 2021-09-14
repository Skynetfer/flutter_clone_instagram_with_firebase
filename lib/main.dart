import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_intagram/screens/home_screen.dart';
import 'package:flutter_clone_intagram/screens/new_feed_screen.dart';
import 'package:flutter_clone_intagram/screens/sign_in_screen.dart';
import 'package:flutter_clone_intagram/screens/sign_up_screen.dart';
import 'package:flutter_clone_intagram/theme.dart';
import 'package:flutter_clone_intagram/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Widget _getScreenId() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen(
            userId: snapshot.data!.uid,
          );
        } else {
          return SignInScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      home: _getScreenId(),
      routes: {
        // "/": (context) => SignInScreen(),
        MyRoutes.signInRouter: (context) => SignInScreen(),
        MyRoutes.signUpRouter: (context) => SignUpScreen(),
        MyRoutes.newFeedRouter: (context) => NewFeedScreen(),
        // MyRoutes.homeScreenRouter: (context) => HomeScreen(),
      },
    );
  }
}
