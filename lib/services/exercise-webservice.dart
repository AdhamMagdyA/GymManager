import 'dart:convert';

import 'package:gym_project/models/tuple.dart';
import 'package:gym_project/widget/global.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';

import 'package:http/http.dart' as http;

class ExerciseWebService {
  String token = Global.token;
  // ExerciseWebService({this.token});
  Future<Tuple<int, List<Exercise>>> getExercises(int page) async {
    // print('Am i here??');
    Tuple<int, List<Exercise>> res = Tuple();
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/exercises?page=$page'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    // print('response obtained!');
    // print(response.statusCode);
    final result = json.decode(response.body);
    String userName = result['data']['name'];
    Global.setUserName(userName);
    if (response.statusCode == 200) {
      res.item1 = result['data']['exercises']['last_page'];
      // Iterable list = result['exercises']['data'];
      Iterable list = result['data']['exercises']['data'];
      // print(list);
      List<Exercise> exercises = list
          .map<Exercise>((exercise) => Exercise.fromJson(exercise))
          .toList();
      List<Exercise> newExercises = exercises.cast<Exercise>().toList();
      res.item2 = newExercises;
      return res;
    } else {
      // print(result.msg);
      throw Exception('response failed');
    }
  }

  Future<Exercise> getExerciseDetails(
    int exerciseId,
  ) async {
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

  Future<Exercise> postExercise(
    Exercise exercise,
  ) async {
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
    ExerciseViewModel exercise,
  ) async {
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

  Future<bool> deleteExercise(
    int exerciseId,
  ) async {
    // print('Am i here??');
    final response = await http.delete(
      Uri.parse('http://localhost:8000/api/exercises/${exerciseId}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('response obtained!');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('response failed');
    }
  }
}
