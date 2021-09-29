import 'package:flutter/foundation.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/screens/coach/exercises/exercises_screen.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';

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

  Map<String, Object> toMapForCreation(List<dynamic> orderedObjects) {
    List<Map<String, Object>> exercisesForCreation = [];
    List<Map<String, Object>> setsForCreation = [];
    orderedObjects.asMap().entries.forEach((MapEntry mapEntry) {
      int index = mapEntry.key;
      var object = mapEntry.value;
      Map<String, Object> objectForCreation = {
        'id': object.id,
        'break_duration': breakDuration,
        'order': index,
      };
      if (object.runtimeType == ExerciseViewModel)
        exercisesForCreation.add(objectForCreation);
      else
        setsForCreation.add(objectForCreation);
    });
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
        jsonExercises
        .map((e) => Exercise.fromJson(e, order: _getOrderFromObject(e)))
        .toList();
    List<dynamic> jsonSets = json['sets'];
    List<Set> sets = jsonSets
        .map((s) => Set.detailsfromJson(s, order: _getOrderFromObject(s)))
        .toList();

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

  // get order of exercise or set
  static int _getOrderFromObject(Map objectJson) {
    Map pivot = objectJson['pivot'];
    int order = pivot['order'];
    return order;
  }
}
