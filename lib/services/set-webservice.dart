import 'package:gym_project/models/set.dart';

import 'package:gym_project/widget/global.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SetWebService {
  String token = Global.token;
  Future<List<Set>> getSets() async {
    print(token);
    print('Am i here??');
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/sets'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      Iterable list = result['sets'];
      List<Set> sets = list.map<Set>((set) => Set.fromJson(set)).toList();
      List<Set> newSets = sets.cast<Set>().toList();
      return newSets;
    } else {
      throw Exception('response failed');
    }
  }

  Future<Set> getSetDetails(int setId) async {
    print('Am i here??');
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/sets/$setId/details'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    if (response.statusCode == 200) {
      final setJson = result['set'];
      return Set.detailsfromJson(setJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<Set> postSet(Set set) async {
    print('posted set:');
    print(set.toJsonForCreation());
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/sets'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: set.toJsonForCreation(),
    );
    print('response obtained!');
    print(response.body);
    if (response.statusCode == 201) {
      final result = json.decode(response.body);
      final exerciseJson = result['set'];
      return Set.detailsfromJson(exerciseJson);
    } else {
      throw Exception('response failed');
    }
  }
}
