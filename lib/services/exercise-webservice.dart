import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gym_project/models/equipment.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ExerciseWebService {
  // String token;
  // ExerciseWebService({this.token});
  Future<List<Exercise>> getExercises(String token) async {
    // print('Am i here??');
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/exercises'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    // print('response obtained!');
    // print(response.statusCode);
    final result = json.decode(response.body);
    if (response.statusCode == 200) {
      // Iterable list = result['exercises']['data'];
      Iterable list = result['exercises'];
      // print(list);
      List<Exercise> exercises = list
          .map<Exercise>((exercise) => Exercise.fromJson(exercise))
          .toList();
      List<Exercise> newExercises = exercises.cast<Exercise>().toList();
      return newExercises;
    } else {
      // print(result.msg);
      throw Exception('response failed');
    }
  }

  Future<Exercise> getExerciseDetails(int exerciseId, String token) async {
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
    final result = json.decode(response.body);
    if (response.statusCode == 200) {
      final exerciseJson = result['exercise'];
      return Exercise.detailsfromJson(exerciseJson);
    } else {
      print(result);
      throw Exception('response failed');
    }
  }

  Future<Exercise> postExercise(Exercise exercise, String token) async {
    // print('Am i here??');
    final response =
        await http.post(Uri.parse('http://localhost:8000/api/exercises'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              'title': exercise.title,
              'description': exercise.description,
              'gif': exercise.gif,
              'cal_burnt': exercise.calBurnt,
              'image': exercise.image,
              'duration': exercise.duration,
              'equipment_id': exercise.equipment.id,
              'reps': exercise.reps,
            }));
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 201) {
      final exerciseJson = result['exercise'];
      return Exercise.detailsfromJson(exerciseJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<Exercise> editExercise(
      ExerciseViewModel exercise, String token) async {
    // print('Am i here??');
    final response = await http.put(
        Uri.parse('http://localhost:8000/api/exercises/${exercise.id}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'title': exercise.title,
          'description': exercise.description,
          'gif': exercise.gif,
          'cal_burnt': exercise.calBurnt,
          'image': exercise.image,
          'duration': exercise.duration,
          'equipment_id': exercise.equipment.id,
          'reps': exercise.reps,
        }));
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      final exerciseJson = result['exercise'];
      return Exercise.detailsfromJson(exerciseJson);
    } else {
      throw Exception('response failed');
    }
  }
}
