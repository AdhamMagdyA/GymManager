import 'exercise.dart';

class Set {
  int id;
  String title;
  String description;
  String coachId;
  String coachName;
  List<Exercise> exercises;

  Set(
      {this.coachName,
      this.id,
      this.title,
      this.description,
      this.coachId,
      this.exercises});

  factory Set.fromJson(Map<String, dynamic> json) {
    return Set(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      coachId: json['coach_id'],
      coachName: json['name'],
    );
  }
  factory Set.detailsfromJson(Map<String, dynamic> json) {
    List<Exercise> _exercises = json['exercises']
        .map<Exercise>((exercise) => Exercise.fromJson(exercise))
        .toList();
    List<Exercise> newExercises = _exercises.cast<Exercise>().toList();
    return Set(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      coachId: json['coach_id'],
      coachName: json['name'],
      exercises: newExercises,
    );
  }
}
