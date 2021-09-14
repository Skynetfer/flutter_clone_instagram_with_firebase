import 'package:flutter/material.dart';
import 'package:flutter_clone_intagram/contants.dart';
import 'package:flutter_clone_intagram/services/auth_service.dart';
import 'package:flutter_clone_intagram/utils/routes.dart';

class SignInScreen extends StatefulWidget {
  static final String id = "/sign_in";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _email, _password;

  bool changeButton = false;
  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      AuthService.signIn(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Clone Instagram",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 50,
                    fontFamily: 'Billabong'),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                          ),
                          validator: (input) => !input!.contains('@')
                              ? 'Please enter a valid email'
                              : null,
                          onSaved: (input) => _email = input!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                          ),
                          validator: (input) => input!.length < 6
                              ? "Password must at least 6 characters"
                              : null,
                          onSaved: (input) => _password = input!,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Material(
                      //   color: Theme.of(context).buttonColor,
                      //   borderRadius:
                      //       BorderRadius.circular(changeButton ? 50 : 8),
                      //   child: InkWell(
                      //     onTap: () => _submit(),
                      //     child: AnimatedContainer(
                      //       duration: Duration(seconds: 1),
                      //       width: changeButton ? 50 : 150,
                      //       height: 40,
                      //       // color: Colors.lightGreen,
                      //       alignment: Alignment.center,
                      //       child: changeButton
                      //           ? Icon(
                      //               Icons.done,
                      //               color: Colors.white,
                      //             )
                      //           : Text(
                      //               "Sign in",
                      //               style: TextStyle(
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 18,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        width: 250.0,
                        child: ElevatedButton(
                          onPressed: _submit,
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.signUpRouter);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
