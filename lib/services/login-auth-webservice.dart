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
      Uri.parse('https://localhost:$portNum/api/login'),
      //Uri.parse('http://127.0.0.1:8000/api/login'),
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
      print(response.body);
      return Login.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to login.');
    }
  }
}
