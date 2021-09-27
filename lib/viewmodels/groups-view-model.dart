import 'package:flutter/foundation.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/group.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';
import 'package:gym_project/viewmodels/set-view-model.dart';

class GroupViewModel {
  Group group;

  GroupViewModel({@required this.group});

  int get id => group.id;
  String get title => group.title;
  String get description => group.description;
  int get coachId => group.coachId;
  List<Exercise> get exercises => group.exercises;
  List<Set> get sets => group.sets;

  List<ExerciseViewModel> get exercisesViewModels {
    return group.exercises.map((e) => ExerciseViewModel(e: e));
  }

  List<SetViewModel> get setsViewModels {
    return group.sets.map((s) => SetViewModel(set: s));
  }

  set id(int id) => this.id = id;
  set title(String title) => this.title = title;
  set description(String description) => this.description = description;
  set coachId(int coachId) => this.coachId = coachId;
  set exercises(List<Exercise> exercises) => this.exercises = exercises;
  set sets(List<Set> sets) => this.sets = sets;

  Map<String, Object> toMap() {
    return group.toMap();
  }

  String toString() {
    return group.toString();
  }
}
