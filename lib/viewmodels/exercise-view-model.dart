import 'package:gym_project/models/equipment.dart';
import 'package:gym_project/models/exercise.dart';

class ExerciseViewModel {
  Exercise exercise;

  ExerciseViewModel({Exercise e}) : exercise = e;

  String get title {
    return exercise.title;
  }

  String get gif {
    return exercise.gif;
  }

  int get id {
    return exercise.id;
  }

  String get description {
    return exercise.description;
  }

  int get reps {
    return exercise.reps;
  }

  String get duration {
    return exercise.duration;
  }

  double get calBurnt {
    return exercise.calBurnt;
  }

  String get image {
    return exercise.image;
  }

  int get coachId {
    return exercise.coachId;
  }

  Equipment get equipment {
    return exercise.equipment;
  }

  String get coachName {
    return exercise.coachName;
  }
}
