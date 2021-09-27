import 'package:flutter/cupertino.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/viewmodels/set-view-model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SetWebService {
  Future<List<Set>> getSets(String token) async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/sets'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result['sets'];
      List<Set> sets = list.map<Set>((set) => Set.fromJson(set)).toList();
      List<Set> newSets = sets.cast<Set>().toList();
      return newSets;
    } else {
      throw Exception('response failed');
    }
  }

  Future<Set> getSetDetails(int setId, String token) async {
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/sets/$setId/details'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final setJson = result['set'];
      return Set.detailsfromJson(setJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<Set> postSet(Set set, String token) async {
    final response =
        await http.post(
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
      return Set.fromJson(exerciseJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<Set> putSet(Set set, String token) async {
    final response = await http.put(
      Uri.parse('http://localhost:8000/api/sets/${set.id}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: set.toJsonForCreation(),
    );
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final setJson = result['set'];
      return Set.fromJson(setJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<void> deleteSet(Set set, String token) async {
    final response = await http.delete(
      Uri.parse('http://127.0.0.1:8000/api/sets/${set.id}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('response failed');
    }
  }
}
