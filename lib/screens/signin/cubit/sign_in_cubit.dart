import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clone_intagram/models/failure_model.dart';
import 'package:flutter_clone_intagram/repositories/auth/auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _authRepository;
  // SignInCubit() : super(SignInInitial());
  SignInCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
          SignInState.initial(),
        );

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: SignInStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: SignInStatus.initial,
      ),
    );
  }

  void signInWithCredentials() async {
    // if (state.email.isNotEmpty && state.password.isNotEmpty ||
    //     state.status == SignInStatus.submitting) return;
    if (!state.isFormValid || state.status == SignInStatus.submitting) return;
    emit(
      state.copyWith(
        status: SignInStatus.submitting,
      ),
    );
    try {
      await _authRepository.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      emit(
        state.copyWith(
          status: SignInStatus.success,
        ),
      );
    } on Failure catch (err) {
      emit(
        state.copyWith(
          failure: err,
          status: SignInStatus.error,
        ),
      );
    }
  }
}
