import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wod_generator_repository/wod_generator_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required WodGeneratorRepository wodGeneratorRepository,
  })  : _wodGeneratorRepository = wodGeneratorRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _wodGeneratorRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
    on<AuthenticationUncacheLastSession>(_onAuthenticationUncacheLastSession);
  }

  final WodGeneratorRepository _wodGeneratorRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _wodGeneratorRepository.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        return emit(user != null
            ? AuthenticationState.authenticated(user)
            : const AuthenticationState.unauthenticated());
      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _wodGeneratorRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _wodGeneratorRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }

  void _onAuthenticationUncacheLastSession(
    AuthenticationUncacheLastSession event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _wodGeneratorRepository.getCachedToken();
  }
}
