import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iqs_flutter_machine_test/model/user_model.dart';

class ApiProvider extends ChangeNotifier {
  List<User> users = [];

  Future<void> getUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      // print(response.body);
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);

        List<User> allUsers = data
            .map((user) => User.fromMap(user as Map<String, dynamic>))
            .toList();
        users = allUsers;
        print(users[5].name);
        notifyListeners();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
