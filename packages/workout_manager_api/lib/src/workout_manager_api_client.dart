import 'dart:convert';

import 'package:http/http.dart';
import 'package:workout_manager_api/workout_manager_api.dart';

class WorkoutManagerApiClient {
  WorkoutManagerApiClient({Client? client}) : _client = client ?? Client();
  static const _baseUrl = 'https://wger.de/api/v2/';

  final Client _client;

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

  Future<void> getExercizes() async {
    try {
      final res = await _client.get(Uri.parse('${_baseUrl}exercisecategory'));
      final decodedRes = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
      print(decodedRes);
    } catch (e) {
      print(e);
    }
  }
}
