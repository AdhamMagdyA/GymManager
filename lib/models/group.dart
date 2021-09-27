import 'package:flutter/foundation.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/screens/coach/exercises/exercises_screen.dart';

class Group {
  int id;
  String title;
  String description;
  int coachId;
  // List<Member> members; ???
  List<Exercise> exercises;
  List<Set> sets;

  Group({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.coachId,
    this.exercises,
    this.sets,
  });

  Map<String, Object> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'coachId': coachId,
      'exercises': exercises,
      'sets': sets,
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
      exercises: exercises,
      sets: sets,
    );
  }
}
