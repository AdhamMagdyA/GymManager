import 'dart:convert';

import 'exercise.dart';

class Set {
  int id;
  String title;
  String description;
  String breakDuration;
  int coachId;
  String coachName;
  List<Exercise> exercises;

  Set(
      {this.coachName,
      this.id,
      this.title,
      this.description,
      this.breakDuration,
      this.coachId,
      this.exercises,
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
      'exercises':
          exercises.map((Exercise exercise) => exercise.toMap()).toList(),
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
  factory Set.detailsfromJson(Map<String, dynamic> json) {
    List<Exercise> exercises = json['exercises']
        .map<Exercise>((exercise) => Exercise.fromJson(exercise))
        .toList();
    // List<Exercise> newExercises = _exercises.cast<Exercise>().toList();
    return Set(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      coachId: json['coach_id'],
      coachName: json['name'],
      exercises: exercises,
    );
  }
}
