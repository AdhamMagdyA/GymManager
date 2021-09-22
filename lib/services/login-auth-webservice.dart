import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gym_project/models/equipment.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/login.dart';
import 'package:gym_project/models/set.dart';
import 'package:http/http.dart' as http;

const portNum = '8000';

class LoginAuthWebService {
  Future<Login> postLogin(String email, String password) async {
    print('currently here');
    final response = await http.post(
      Uri.parse('http://localhost:$portNum/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE',
        'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        'Accept': '*/*',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(response.body);
      return Login.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to login.');
    }
  }
}
