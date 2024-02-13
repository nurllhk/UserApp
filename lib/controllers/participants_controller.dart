

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../services/participants_service.dart';

class Participants extends ChangeNotifier  {

  final ParticipantsService _service = ParticipantsService();

  Future<List<Users>> fetchUsers() async {

    List<Users> users = [];
    try {
      final responseData = await _service.getUsers();
      for (var userjson in responseData["data"]) {
        // Todo Page index yapısını modele katmadım her bir user nesnesi data dan geliyor
        users.add(Users.fromJson(userjson));
      }
      return users;
    } catch (e) {
     print("Error ${e}");
      return [];
    }
  }


}

final participantsProvider = ChangeNotifierProvider((ref) => Participants());