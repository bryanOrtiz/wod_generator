import 'dart:convert';

import 'package:workout_manager_api/workout_manager_api.dart' hide User;

import 'models/models.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  UserRepository({WorkoutManagerApiClient? workoutManagerApiClient})
      : _workoutManagerApiClient =
            workoutManagerApiClient ?? WorkoutManagerApiClient();
  User? _user;
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final kUser = 'kUser';
  final WorkoutManagerApiClient _workoutManagerApiClient;

  Future<User?> getUser() async {
    if (_user != null) return _user;

    final userPage = await _workoutManagerApiClient.getUser();
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

    // final prefs = await SharedPreferences.getInstance(); //cawait _prefs;
    // if (!prefs.containsKey(kUser)) return null;
    // final json = prefs.getString(kUser);
    // if (json == null) return null;
    // return User.fromJson(jsonDecode(json));
  }

  Future<void> storeUser({required User user}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kUser, jsonEncode(user.toJson()));
  }
}
