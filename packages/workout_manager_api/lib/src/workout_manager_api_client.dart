import 'dart:convert';

import 'package:http/http.dart';
import 'package:workout_manager_api/workout_manager_api.dart';

class WorkoutManagerApiClient {
  WorkoutManagerApiClient({Client? client}) : _client = client ?? Client();
  static const _baseUrl = 'https://wger.de/api/v2/';

  final Client _client;

  Map<String, String> _headers(String token) {
    return {
      'Authorization': 'Token ${token}',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
  }

  Future<String> login(String username, String password) async {
    final res = await _client.post(
      Uri.parse('${_baseUrl}login/'),
      body: {
        'username': username,
        'password': password,
      },
    );
    final decodedRes = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
    var token = decodedRes['token'];
    return token;
  }

  Future<Page<User>> getUser({required String token}) async {
    final res = await _client.get(
      Uri.parse('${_baseUrl}userprofile/'),
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
    final decodedRes = jsonDecode(res.body);
    return Page<User>.fromJson(
      decodedRes,
      (data) => User.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<Page<Exercise>> getExercises({required String token}) async {
    final res = await _client.get(
      Uri.parse('${_baseUrl}exercise'),
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
    final decodedRes = jsonDecode(res.body);
    return Page<Exercise>.fromJson(
      decodedRes,
      (data) => Exercise.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<Workout> createWorkout({
    required String token,
    required String name,
    required String description,
  }) async {
    final res = await _client.post(
      Uri.parse('${_baseUrl}workout/'),
      headers: {
        'Authorization': 'Token ${token}',
      },
      body: {
        'name': name,
        'description': description,
      },
    );
    final decodedRes = jsonDecode(res.body);
    return Workout.fromJson(decodedRes as Map<String, dynamic>);
  }

  Future<Page<DaysOfTheWeek>> getDaysOfTheWeek({
    required String token,
  }) async {
    final res = await _client.get(
      Uri.parse('${_baseUrl}daysofweek'),
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
    final decodedRes = jsonDecode(res.body);
    return Page<DaysOfTheWeek>.fromJson(
      decodedRes,
      (data) => DaysOfTheWeek.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<Day> createDay({
    required String token,
    required Day day,
  }) async {
    final res = await post(
      Uri.parse('${_baseUrl}day/'),
      headers: {
        'Authorization': 'Token ${token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(day.toJson()),
    );
    final decodedRes = jsonDecode(res.body);
    return Day.fromJson(decodedRes);
  }

  Future<Set> createSet({
    required String token,
    required Set set,
  }) async {
    final res = await post(
      Uri.parse('${_baseUrl}set/'),
      headers: {
        'Authorization': 'Token ${token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(set.toJson()),
    );
    final decodedRes = jsonDecode(res.body);
    return Set.fromJson(decodedRes);
  }

  Future<Page<SettingRepitionUnit>> getSettingRepitionUnits({
    required String token,
  }) async {
    final res = await _client.get(
      Uri.parse('${_baseUrl}setting-repetitionunit'),
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
    final decodedRes = jsonDecode(res.body);
    return Page<SettingRepitionUnit>.fromJson(
      decodedRes,
      (data) => SettingRepitionUnit.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<Page<SettingWeightUnit>> getSettingWeightUnits({
    required String token,
  }) async {
    final res = await _client.get(
      Uri.parse('${_baseUrl}setting-weightunit'),
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
    final decodedRes = jsonDecode(res.body);
    return Page<SettingWeightUnit>.fromJson(
      decodedRes,
      (data) => SettingWeightUnit.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<Setting> createSetting({
    required String token,
    required Setting setting,
  }) async {
    final res = await post(
      Uri.parse('${_baseUrl}setting/'),
      headers: {
        'Authorization': 'Token ${token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(setting.toJson()),
    );
    final decodedRes = jsonDecode(res.body);
    return Setting.fromJson(decodedRes);
  }

  Future<Suggestions<SearchExercise>> searchExerciseByTerm({
    required String token,
    required String term,
  }) async {
    final res = await _client.get(
      Uri.parse('${_baseUrl}exercise/search/?term=${term}'),
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
    final decodedRes = jsonDecode(res.body);
    return Suggestions<SearchExercise>.fromJson(
      decodedRes,
      (data) => SearchExercise.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<Page<Workout>> getWorkouts({
    required String token,
  }) async {
    final res = await get(
      Uri.parse('${_baseUrl}workout/'),
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
    final decodedRes = jsonDecode(res.body);
    return Page<Workout>.fromJson(
      decodedRes,
      (data) => Workout.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<WorkoutInfo> getWorkoutDetails({
    required String token,
    required String id,
  }) async {
    final res = await get(
      Uri.parse('${_baseUrl}workout/$id/canonical_representation/'),
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
    final decodedRes = jsonDecode(res.body);
    return WorkoutInfo.fromJson(decodedRes as Map<String, dynamic>);
  }

  Future<void> deleteWorkout({
    required String token,
    required String id,
  }) async {
    await delete(
      Uri.parse('${_baseUrl}workout/$id/'),
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
  }

  Future<Workout> updateWorkout({
    required String token,
    required Workout workout,
  }) async {
    final res = await patch(
      Uri.parse('${_baseUrl}workout/${workout.id}/'),
      headers: _headers(token),
      body: jsonEncode(workout.toJson()),
    );
    final decodedRes = jsonDecode(res.body);
    return Workout.fromJson(decodedRes as Map<String, dynamic>);
  }

  Future<Page<Day>> getDayTrainingId({
    required String token,
    required String id,
  }) async {
    final filter = {
      'training': id,
    };
    final res = await get(
      Uri.parse('${_baseUrl}day/').replace(
        queryParameters: filter,
      ),
      headers: _headers(token),
    );
    final decodedRes = jsonDecode(res.body);
    return Page<Day>.fromJson(
        decodedRes, (data) => Day.fromJson(data as Map<String, dynamic>));
  }

  Future<Page<Set>> getSetByDayId({
    required String token,
    required String dayId,
  }) async {
    final filter = {
      'day': dayId,
    };
    final res = await get(
      Uri.parse('${_baseUrl}set/').replace(
        queryParameters: filter,
      ),
      headers: _headers(token),
    );
    final decodedRes = jsonDecode(res.body);
    return Page<Set>.fromJson(
        decodedRes, (data) => Set.fromJson(data as Map<String, dynamic>));
  }

  Future<Set> updateSet({
    required String token,
    required Set set,
  }) async {
    final res = await patch(
      Uri.parse('${_baseUrl}set/${set.id}/'),
      headers: _headers(token),
      body: jsonEncode(set.toJson()),
    );
    return Set.fromJson(jsonDecode(res.body));
  }

  Future<Page<Setting>> getSettingsBySetId({
    required String token,
    required String setId,
  }) async {
    final filter = {
      'set': setId,
    };
    final res = await get(
      Uri.parse('${_baseUrl}setting/').replace(
        queryParameters: filter,
      ),
      headers: _headers(token),
    );
    final decodedRes = jsonDecode(res.body);
    return Page<Setting>.fromJson(
        decodedRes, (data) => Setting.fromJson(data as Map<String, dynamic>));
  }

  Future<Setting> updateSetting({
    required String token,
    required Setting setting,
  }) async {
    final res = await patch(
      Uri.parse('${_baseUrl}setting/${setting.id}/'),
      headers: _headers(token),
      body: jsonEncode(setting.toJson()),
    );
    return Setting.fromJson(jsonDecode(res.body));
  }

  Future<void> deleteSettingsBySetId({
    required String token,
    required String setId,
  }) async {
    final filter = {
      'set': setId,
    };
    await delete(
      Uri.parse('${_baseUrl}setting/${setId}/').replace(
        queryParameters: filter,
      ),
      headers: _headers(token),
    );
  }
}
