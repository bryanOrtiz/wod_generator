import 'dart:convert';

import 'package:http/http.dart';

class Net {
  final baseUrl = 'https://wger.de/api/v2/';

  final client = Client();

  late var _token;

  Future<String> login(String username, String password) async {
    final res = await client.post(
      Uri.parse('${baseUrl}login/'),
      body: {
        'username': username,
        'password': password,
      },
    );
    final decodedRes = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
    var token = decodedRes['token'];
    _token = token;
    return token;
  }

  Future<void> getExercizes() async {
    try {
      final res = await client.get(Uri.parse('${baseUrl}exercisecategory'));
      final decodedRes = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
      print(decodedRes);
    } catch (e) {
      print(e);
    }
  }
}
