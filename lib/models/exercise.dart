import 'package:gym_project/models/equipment.dart';

class Exercise {
  int id;
  String title;
  String description;
  String duration;
  String gif;
  double calBurnt;
  int reps;
  String image;
  Equipment equipment;
  String coachName;
  int coachId;
  Exercise({
    this.id,
    this.title,
    this.description,
    this.duration,
    this.gif,
    this.calBurnt,
    this.reps,
    this.image,
    this.coachId,
    this.coachName,
    this.equipment,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      gif: json['gif'],
      calBurnt: json['cal_burnt'],
      reps: json['reps'],
      image: json['image'],
      coachId: json['coach_id'],
      coachName: json['name'] ?? '',
    );
  }
  factory Exercise.detailsfromJson(Map<String, dynamic> json) {
    // print(json);
    return Exercise(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      equipment: Equipment.fromJson(json['equipments'][0]),
      duration: json['duration'],
      gif: json['gif'],
      calBurnt: json['cal_burnt'],
      reps: json['reps'],
      image: json['image'],
      coachId: json['coach_id'],
      coachName: json['coach']['user']['name'] ?? '',
    );
  }
}
