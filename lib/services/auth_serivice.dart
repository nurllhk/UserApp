import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  Future<bool> signinWithEmailAndPassword(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      saveAuthToken(res["token"]);
      return true;
    } else {
      return false;
      // throw Exception("Hata ${response.statusCode}");
    }
  }

  static Future<void> saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("authToken", token);
  }



  static Future<void> deleteAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("authToken");
  }
}
