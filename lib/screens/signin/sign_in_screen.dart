import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clone_intagram/repositories/auth/auth_repository.dart';
import 'package:flutter_clone_intagram/screens/signup/sign_up_screen.dart';
import 'package:flutter_clone_intagram/widgets/widgets.dart';

import 'cubit/sign_in_cubit.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = "/signin";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static Route route() {
    return PageRouteBuilder(
        pageBuilder: (context, __, ___) => BlocProvider<SignInCubit>(
              create: (_) => SignInCubit(
                authRepository: context.read<AuthRepository>(),
              ),
              child: SignInScreen(),
            ),
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
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state.status == SignInStatus.error) {
              showDialog(
                context: context,
                builder: (context) =>
                    ErrorDialog(content: state.failure.message),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Email",
                              ),
                              onChanged: (value) => context
                                  .read<SignInCubit>()
                                  .emailChanged(value),
                              validator: (value) => !value!.contains("@")
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
                              onChanged: (value) => context
                                  .read<SignInCubit>()
                                  .passwordChanged(value),
                              validator: (value) => value!.length < 6
                                  ? "Password must at least 6 chareacter"
                                  : null,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            ElevatedButton(
                              onPressed: () => _submitForm(
                                context,
                                state.status == SignInStatus.submitting,
                              ),
                              child: Text('Sign in'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(SignUpScreen.routeName),
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
            );
          },
        ),
      ),
    );
  }

  void _submitForm(BuildContext context, bool isSubmitting) {
    if (_formKey.currentState!.validate() && !isSubmitting) {
      context.read<SignInCubit>().signInWithCredentials();
    }
  }
}
