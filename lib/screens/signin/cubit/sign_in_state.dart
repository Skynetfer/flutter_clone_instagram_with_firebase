part of 'sign_in_cubit.dart';

enum SignInStatus { initial, submitting, success, error }

class SignInState extends Equatable {
  final String email;
  final String password;
  final SignInStatus status;
  final Failure failure;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;
  const SignInState({
    required this.email,
    required this.password,
    required this.status,
    required this.failure,
  });

  factory SignInState.initial() {
    return SignInState(
      email: "",
      password: "",
      status: SignInStatus.initial,
      failure: Failure(),
    );
  }
  @override
  // TODO: implement stringify
  bool? get stringify => true;

  @override
  List<Object> get props => [
        email,
        password,
        status,
        failure,
      ];

  SignInState copyWith({
    String? email,
    String? password,
    SignInStatus? status,
    Failure? failure,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}

// class SignInInitial extends SignInState {}
