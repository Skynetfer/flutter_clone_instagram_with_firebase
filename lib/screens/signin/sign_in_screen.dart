import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = "/login";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static Route route() {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => SignInScreen(),
        settings: RouteSettings(name: routeName),
        transitionDuration: Duration(seconds: 0));
  }

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Instagram",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                          onChanged: (value) => print(value),
                          validator: (value) => value!.contains("@")
                              ? "please enter a valid email"
                              : null,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                          onChanged: (value) => print(value),
                          validator: (value) => value!.length < 6
                              ? "Password must at least 6 chareacter"
                              : null,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ElevatedButton(
                          onPressed: () => print("Sign in"),
                          child: Text('Sign in'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              print("Navigator to the Signup Screen"),
                          child: Text(
                            "No account? Sign up",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                // <-- Radius
                              ),
                              primary: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
