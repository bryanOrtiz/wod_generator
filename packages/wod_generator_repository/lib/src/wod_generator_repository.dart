import 'dart:async';

import 'package:workout_manager_api/workout_manager_api.dart' hide User;

import 'models/models.dart';

import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class WodGeneratorRepository {
  WodGeneratorRepository({WorkoutManagerApiClient? workoutManagerApiClient})
      : _workoutManagerApiClient =
            workoutManagerApiClient ?? WorkoutManagerApiClient();
  final _controller = StreamController<AuthenticationStatus>();

  final kToken = 'kToken';
  late String _token;

  final WorkoutManagerApiClient _workoutManagerApiClient;

  Future<User?> getUser() async {
    final userPage = await _workoutManagerApiClient.getUser(token: _token);
    final user = userPage.results.first;
    return User(
        user: user.user,
        gym: user.gym,
        isTemporary: user.isTemporary,
        showComments: user.showComments,
        workoutReminderActive: user.workoutReminderActive,
        workoutReminder: user.workoutReminder,
        workoutDuration: user.workoutDuration,
        lastWorkoutNotification: user.lastWorkoutNotification,
        notificationLanguage: user.notificationLanguage,
        age: user.age,
        birthdate: user.birthdate,
        height: user.height,
        gender: user.gender,
        weightUnit: user.weightUnit);
  }

  Future<void> getCachedToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(kToken);
    if (token != null) {
      _token = token;
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final token = await _workoutManagerApiClient.login(email, password);
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kToken, _token);
    _controller.add(AuthenticationStatus.authenticated);
  }

  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  void logOut() async {
    final prefs = await SharedPreferences.getInstance();
    _token = '';
    prefs.remove(kToken);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
