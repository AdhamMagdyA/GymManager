import 'package:flutter/material.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/services/exercise-webservice.dart';

import 'exercise-view-model.dart';

enum LoadingStatus {
  Completed,
  Searching,
  Empty,
  Error,
}

class ExerciseListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.Empty;

  // ignore: deprecated_member_use
  List<ExerciseViewModel> exercises = List<ExerciseViewModel>();
  ExerciseViewModel exercise;

  // methods to fetch news
  void fetchListExercises() async {
    print('currently here!');
    List<Exercise> _exercises = await ExerciseWebService().getExercises();
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.exercises =
        _exercises.map((exercise) => ExerciseViewModel(e: exercise)).toList();

    if (this.exercises.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  void fetchExercise(int exerciseId) async {
    print(exerciseId);
    print('currently here!');
    Exercise _exercise =
        await ExerciseWebService().getExerciseDetails(exerciseId);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.exercise = ExerciseViewModel(e: _exercise);
    print(exercise.id);

    if (this.exercise == null) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  void postExercise(Exercise exercise) async {
    // print('currently here!');
    Exercise _exercise = await ExerciseWebService().postExercise(exercise);
    if (_exercise == null) {
      loadingStatus = LoadingStatus.Error;
    }
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.exercise = ExerciseViewModel(e: _exercise);

    if (this.exercise == null) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }
}
