import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gym_project/models/equipment.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/privateSession.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PrivateSessionWebService {
  // String token;
  // PrivateSessionWebService({this.token});
  Future<List<PrivateSession>> getMyPrivateSessions(String token) async {
    print('Am i here??');
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/sessions/index'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions'];
      // print(list);
      List<PrivateSession> privateSessions = list
          .map<PrivateSession>(
              (privateSession) => PrivateSession.fromJson(privateSession))
          .toList();
      List<PrivateSession> newPrivateSessions =
          privateSessions.cast<PrivateSession>().toList();
      return newPrivateSessions;
    } else {
      // print(result.msg);
      throw Exception('response failed');
    }
  }

  Future<List<PrivateSession>> getBookedPrivateSessions(String token) async {
    print('Am i here??');
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/sessions/booked'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions'];
      // print(list);
      List<PrivateSession> privateSessions = list
          .map<PrivateSession>(
              (privateSession) => PrivateSession.fromJson(privateSession))
          .toList();
      List<PrivateSession> newPrivateSessions =
          privateSessions.cast<PrivateSession>().toList();
      return newPrivateSessions;
    } else {
      // print(result.msg);
      throw Exception('response failed');
    }
  }

  Future<List<PrivateSession>> getPrivateSessions(String token) async {
    print('Am i here??');
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/sessions'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions'];
      // print(list);
      List<PrivateSession> privateSessions = list
          .map<PrivateSession>(
              (privateSession) => PrivateSession.fromJson(privateSession))
          .toList();
      List<PrivateSession> newPrivateSessions =
          privateSessions.cast<PrivateSession>().toList();
      return newPrivateSessions;
    } else {
      // print(result.msg);
      throw Exception('response failed');
    }
  }

  Future<PrivateSession> getPrivateSessionDetails(
      int sessionId, String token) async {
    print('Am i here??');
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/sessions/$sessionId/details'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    if (response.statusCode == 200) {
      final privateSessionJson = result['privateSession'];
      return PrivateSession.fromJson(privateSessionJson);
    } else {
      print(result);
      throw Exception('response failed');
    }
  }

  Future<bool> deletePrivateSession(int sessionId, String token) async {
    // print('Am i here??');
    final response = await http.delete(
      Uri.parse('http://localhost:8000/api/sessions/$sessionId'),
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

  // Future<Exercise> postExercise(Exercise exercise, String token) async {
  //   // print('Am i here??');
  //   final response =
  //       await http.post(Uri.parse('http://localhost:8000/api/exercises'),
  //           headers: {
  //             'Content-Type': 'application/json',
  //             'Accept': 'application/json',
  //             'Authorization': 'Bearer $token',
  //           },
  //           body: jsonEncode({
  //             'title': exercise.title,
  //             'description': exercise.description,
  //             'gif': exercise.gif,
  //             'cal_burnt': exercise.calBurnt,
  //             'image': exercise.image,
  //             'duration': exercise.duration,
  //             'equipment_id': exercise.equipment.id,
  //             'reps': exercise.reps,
  //           }));
  //   print('response obtained!');
  //   print(response.statusCode);
  //   final result = json.decode(response.body);
  //   print(result);
  //   if (response.statusCode == 201) {
  //     final exerciseJson = result['exercise'];
  //     return Exercise.detailsfromJson(exerciseJson);
  //   } else {
  //     throw Exception('response failed');
  //   }
  // }

  // Future<Exercise> editExercise(
  //     ExerciseViewModel exercise, String token) async {
  //   // print('Am i here??');
  //   final response = await http.put(
  //       Uri.parse('http://localhost:8000/api/exercises/${exercise.id}'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: jsonEncode({
  //         'title': exercise.title,
  //         'description': exercise.description,
  //         'gif': exercise.gif,
  //         'cal_burnt': exercise.calBurnt,
  //         'image': exercise.image,
  //         'duration': exercise.duration,
  //         'equipment_id': exercise.equipment.id,
  //         'reps': exercise.reps,
  //       }));
  //   print('response obtained!');
  //   print(response.statusCode);
  //   final result = json.decode(response.body);
  //   print(result);
  //   if (response.statusCode == 200) {
  //     final exerciseJson = result['exercise'];
  //     return Exercise.detailsfromJson(exerciseJson);
  //   } else {
  //     throw Exception('response failed');
  //   }
  // }
}
