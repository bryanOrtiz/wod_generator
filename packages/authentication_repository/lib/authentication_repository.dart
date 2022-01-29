library authentication_repository;

import 'dart:async';
import 'package:workout_manager_api/workout_manager_api.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository({WorkoutManagerApiClient? workoutManagerApiClient})
      : _workoutManagerApiClient =
            workoutManagerApiClient ?? WorkoutManagerApiClient();
  final _controller = StreamController<AuthenticationStatus>();
  final WorkoutManagerApiClient _workoutManagerApiClient;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _workoutManagerApiClient.login(email, password);
    _controller.add(AuthenticationStatus.authenticated);
  }

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
