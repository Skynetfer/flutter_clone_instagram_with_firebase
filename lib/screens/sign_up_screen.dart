import 'package:flutter/material.dart';
import 'package:flutter_clone_intagram/services/auth_service.dart';
import 'package:flutter_clone_intagram/utils/routes.dart';

import '../contants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _email, _password;
  // bool changeButton = false;
  // _submit(BuildContext context) async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       changeButton = true;
  //       AuthService.signUpUser(context, _name, _email, _password);
  //     });
  //     await Future.delayed(
  //       Duration(
  //         seconds: 1,
  //       ),
  //     );
  //     await Navigator.pushNamed(context, MyRoutes.newFeedRouter);
  //     setState(() {
  //       changeButton = false;
  //     });
  //   }
  // }
  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Logging in the user w/ Firebase
      AuthService.signUpUser(context, _name, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Name",
                          ),
                          validator: (input) =>
                              input!.isEmpty ? 'Please enter a name' : null,
                          onSaved: (input) => _name = input!,
                        ),
                      ),
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
                      //     onTap: () => _submit(context),
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
                      //               "Sign up",
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
                            'Sign Up',
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
                            "You have an account?",
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.signInRouter);
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
