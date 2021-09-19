import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/set.dart';

class SetViewModel {
  Set set;

  SetViewModel({Set s}) : set = s;

  String get title {
    return set.title;
  }

  int get id {
    return set.id;
  }

  String get description {
    return set.description;
  }

  String get coachId {
    return set.coachId;
  }

  String get coachName {
    return set.coachName;
  }

  List<Exercise> get exercises {
    return set.exercises;
  }
}