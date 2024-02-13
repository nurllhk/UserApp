import 'dart:convert';

import 'package:http/http.dart' as http;

class ParticipantsService {
  Future<Map<String,dynamic>> getUsers() async {
    final url = Uri.parse('https://reqres.in/api/users?page=2');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData;
    } else {
      throw Exception("Error ${response.statusCode}");
    }
  }
}
