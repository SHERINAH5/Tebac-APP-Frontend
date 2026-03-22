import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class AuthService {
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConfig.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {
        'success': true,
        'user': data['user'],
        'token': data['access_token'],
      };
    } else {
      return {
        'success': false,
        'message': data['message'] ?? 'Login failed',
      };
    }
  }

  static Future<Map<String, dynamic>> register(
    Map<String, dynamic> payload) async {
  final response = await http.post(
    Uri.parse(ApiConfig.register),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(payload),
  );

  final data = jsonDecode(response.body);

  if (response.statusCode == 201) {
    return {'success': true, 'data': data};
  } else {
    return {
      'success': false,
      'message': data['message'] ?? 'Registration failed',
    };
  }
}
}