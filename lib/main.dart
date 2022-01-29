import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'app.dart';
import 'package:user_repository/user_repository.dart';
import 'package:workout_manager_api/workout_manager_api.dart';

void main() {
  final _workoutManagerApiClient = WorkoutManagerApiClient();

  runApp(App(
    authenticationRepository: AuthenticationRepository(
        workoutManagerApiClient: _workoutManagerApiClient),
    userRepository:
        UserRepository(workoutManagerApiClient: _workoutManagerApiClient),
  ));
}
