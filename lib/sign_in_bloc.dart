import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wod_generator/net.dart';

import 'form_state.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInUsernameChanged extends SignInEvent {
  const SignInUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class SignInPasswordChanged extends SignInEvent {
  const SignInPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignInSubmitted extends SignInEvent {
  const SignInSubmitted();
}

class SignInState extends Equatable {
  const SignInState({
    this.username = '',
    this.password = '',
    this.formState = FormState.none,
  });

  final String username;
  final String password;
  final FormState formState;

  SignInState copyWith({
    String? username,
    String? password,
    FormState? formState,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      formState: formState ?? this.formState,
    );
  }

  @override
  List<Object> get props => [username, password, formState];
}

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required Net net})
      : _net = net,
        super(const SignInState()) {
    on<SignInUsernameChanged>(_onUsernameChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSubmitted);
  }

  final Net _net;

  void _onUsernameChanged(
    SignInUsernameChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(username: event.username));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(state.copyWith(formState: FormState.progress));
      final token = await _net.login(state.username, state.password);
      print(token);
      emit(state.copyWith(formState: FormState.success));
    } catch (e) {
      print(e);
      emit(state.copyWith(formState: FormState.failure));
    }
  }
}
