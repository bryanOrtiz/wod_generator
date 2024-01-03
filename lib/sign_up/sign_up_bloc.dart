import 'package:equatable/equatable.dart';
import 'package:firebase_auth_api/firebase_auth_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../sign_in/models/email.dart';
import '../sign_in/models/password.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpEmailUpdated extends SignUpEvent {
  const SignUpEmailUpdated({required this.emailTxt});

  final String emailTxt;

  @override
  List<Object> get props => [emailTxt];
}

class SignUpPasswordUpdated extends SignUpEvent {
  const SignUpPasswordUpdated({required this.passwordTxt});

  final String passwordTxt;

  @override
  List<Object> get props => [passwordTxt];
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;

  @override
  List<Object> get props => [email, password, status];

  SignUpState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required FirebaseAuthApi firebaseAuthApi})
      : _firebaseAuthApi = firebaseAuthApi,
        super(const SignUpState()) {
    on<SignUpEmailUpdated>(onEmailUpdated);
    on<SignUpPasswordUpdated>(onPasswordUpdated);
    on<SignUpSubmitted>(onSignUpSubmitted);
  }

  final FirebaseAuthApi _firebaseAuthApi;

  void onEmailUpdated(
    SignUpEmailUpdated event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(email: Email.dirty(event.emailTxt)));
  }

  void onPasswordUpdated(
    SignUpPasswordUpdated event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(password: Password.dirty(event.passwordTxt)));
  }

  Future<void> onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.email.isNotValid || state.password.isNotValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _firebaseAuthApi.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
