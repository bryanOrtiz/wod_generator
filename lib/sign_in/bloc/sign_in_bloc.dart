import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:wod_generator/sign_in/models/models.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEmailChanged extends SignInEvent {
  const SignInEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
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
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final FormzStatus status;

  SignInState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required WodGeneratorRepository wodGeneratorRepository})
      : _wodGeneratorRepository = wodGeneratorRepository,
        super(const SignInState()) {
    on<SignInEmailChanged>(_onUsernameChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSubmitted);
  }

  final WodGeneratorRepository _wodGeneratorRepository;

  void _onUsernameChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [state.password, email],
        ),
      ),
    );
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
          [state.email, password],
        ),
      ),
    );
  }

  void _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _wodGeneratorRepository.login(
          email: state.email.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
