import 'package:flutter/foundation.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/screens/coach/exercises/exercises_screen.dart';

class Group {
  int id;
  String title;
  String description;
  int coachId;
  String breakDuration;
  // List<Member> members; ???
  List<Exercise> exercises;
  List<Set> sets;

  Group({
    this.id,
    @required this.title,
    @required this.description,
    @required this.coachId,
    this.breakDuration,
    this.exercises,
    this.sets,
  });

  Map<String, Object> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'coachId': coachId,
      'break_duration': breakDuration,
      'exercises': exercises,
      'sets': sets,
    };
  }

  Map<String, Object> toMapForCreation() {
    List<Map<String, Object>> exercisesForCreation = exercises.map((exercise) {
      return {
        'id': exercise.id,
        'break_duration': breakDuration,
      };
    }).toList();
    List<Map<String, Object>> setsForCreation = sets.map((set) {
      return {
        'id': set.id,
        'break_duration': breakDuration,
      };
    }).toList();
    return {
      'title': title,
      'description': description,
      'exercises': exercisesForCreation,
      'sets': setsForCreation,
    };
  }

  String toString() {
    return toMap().toString();
  }

  factory Group.fromJson(Map<String, Object> json) {
    return Group(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      coachId: json['coach_id'],
    );
  }

  factory Group.detailsFromJson(Map<String, Object> json) {
    List<dynamic> jsonExercises = json['exercises'];
    List<Exercise> exercises =
        jsonExercises.map((e) => Exercise.fromJson(e)).toList();
    List<dynamic> jsonSets = json['sets'];
    List<Set> sets = jsonSets.map((s) => Set.detailsfromJson(s)).toList();

    return Group(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      coachId: json['coach_id'],
      breakDuration: _getBreakDurationFromJsonGroup(json),
      exercises: exercises,
      sets: sets,
    );
  }

  static String _getBreakDurationFromJsonGroup(Map<String, dynamic> jsonGroup) {
    List exercises = jsonGroup['exercises'];
    List sets = jsonGroup['sets'];
    if (exercises.isNotEmpty) {
      Map pivot = exercises.first['pivot'];
      String breakDuration = pivot['break_duration'];
      return breakDuration;
    } else if (sets.isNotEmpty) {
      Map pivot = sets.first['pivot'];
      String breakDuration = pivot['break_duration'];
      return breakDuration;
    } else {
      return '00:00';
    }
  }
}
