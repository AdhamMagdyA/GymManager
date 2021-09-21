import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gym_project/models/equipment.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/set.dart';
import 'package:http/http.dart' as http;

const token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjMxOTY5NTY3LCJleHAiOjE2MzIwNTU5NjcsIm5iZiI6MTYzMTk2OTU2NywianRpIjoiT2pYN2g4RlRtMVN2SkFFSiIsInN1YiI6OSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.s4VPWa6tyKR4k3vhrtG-1TFcBqVJKCB5F_98s24QTWQ';

class WebService {
  Future<List<Equipment>> getEquipments() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/equipments'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result['equipments'];
      return list.map((equipment) => Equipment.fromJson(equipment)).toList();
    } else {
      throw Exception('response failed');
    }
  }

  Future<List<Exercise>> getExercises() async {
    print('Am i here??');
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/exercises'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result['exercises']['data'];
      List<Exercise> exercises = list
          .map<Exercise>((exercise) => Exercise.fromJson(exercise))
          .toList();
      List<Exercise> newExercises = exercises.cast<Exercise>().toList();
      return newExercises;
    } else {
      throw Exception('response failed');
    }
  }

  Future<Exercise> getExerciseDetails(int exerciseId) async {
    print('Am i here??');
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/exercises/$exerciseId/details'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print('response obtained!');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final exerciseJson = result['exercise'];
      return Exercise.detailsfromJson(exerciseJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<List<Set>> getSets() async {
    print('Am i here??');
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/sets'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result['sets']['data'];
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
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final setJson = result['set'];
      return Set.detailsfromJson(setJson);
    } else {
      throw Exception('response failed');
    }
  }
}
