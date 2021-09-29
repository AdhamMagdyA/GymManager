import 'dart:convert';

import 'package:gym_project/screens/coach/exercises/exercises_screen.dart';

import 'exercise.dart';

class Set {
  int id;
  String title;
  String description;
  String breakDuration;
  int coachId;
  String coachName;
  List<Exercise> exercises;
  int order;

  Set(
      {this.coachName,
      this.id,
      this.title,
      this.description,
      this.breakDuration,
      this.coachId,
      this.exercises,
      this.order
  });

  String toString() {
    return toMap().toString();
  }

  Map<String, Object> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'coachId': coachId,
      'break_duration': breakDuration,
      'order': order,
      'exercises':
          exercises?.map((Exercise exercise) => exercise.toMap())?.toList(),
    };
  }

  String toJsonForCreation() {
    Map<String, Object> mappedSet = {
      'title': title,
      'description': description,
      'coachId': coachId,
      'exercises': exercises
          .map((Exercise exercise) => {
                'id': exercise.id,
                'break_duration': breakDuration,
              })
          .toList(),
    };
    return json.encode(mappedSet);
  }

  factory Set.fromJson(Map<String, dynamic> json) {
    return Set(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      coachId: json['coach_id'],
      coachName: json['name'] ?? 'unknown',
    );
  }
  factory Set.detailsfromJson(Map<String, dynamic> json, {int order}) {
    List<Exercise> exercises = json['exercises']
        .map<Exercise>((exercise) =>
            Exercise.fromJson(exercise, order: _getOrderFromObject(exercise)))
        .toList();
    // List<Exercise> newExercises = _exercises.cast<Exercise>().toList();
    return Set(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      breakDuration: Set._getBreakDurationFromJsonSet(json),
      coachId: json['coach_id'],
      coachName: json['name'],
      order: order,
      exercises: exercises,
    );
  }

  static String _getBreakDurationFromJsonSet(Map<String, dynamic> jsonSet) {
    List exercises = jsonSet['exercises'];
    if (exercises.isNotEmpty) {
      Map pivot = exercises.first['pivot'];
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
