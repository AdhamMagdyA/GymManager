import 'package:flutter/material.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/tuple.dart';
import 'package:gym_project/services/exercise-webservice.dart';

import 'exercise-view-model.dart';

enum LoadingStatus {
  Completed,
  Searching,
  Empty,
  Error,
}
var generalToken;

class ExerciseListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.Empty;

  ExerciseWebService webService = ExerciseWebService();

  // ignore: deprecated_member_use
  List<ExerciseViewModel> exercises = List<ExerciseViewModel>();
  ExerciseViewModel exercise = ExerciseViewModel();
  int lastPage;
  Future<void> fetchListExercises(int page) async {
    // print('welcome token! $');
    // print('currently here!');
    Tuple<int, List<Exercise>> result = await webService.getExercises(page);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.exercises =
        result.item2.map((exercise) => ExerciseViewModel(e: exercise)).toList();
    this.lastPage = result.item1;
    if (this.exercises.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> fetchExercise(
    int exerciseId,
  ) async {
    print(exerciseId);
    print('currently here!');
    // print('welcome token! $');
    Exercise _exercise = await webService.getExerciseDetails(
      exerciseId,
    );
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

  Future<void> postExercise(
    Exercise exercise,
  ) async {
    // print('currently here!');
    Exercise _exercise = await webService.postExercise(
      exercise,
    );
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

  Future<void> editExercise(
    ExerciseViewModel exercise,
  ) async {
    // print('currently here!');
    Exercise _exercise = await webService.editExercise(
      exercise,
    );
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

  Future<void> deleteExercise(
    int exerciseId,
  ) async {
    // print('currently here!');
    bool status = await webService.deleteExercise(
      exerciseId,
    );
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();

    if (status == false) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }
}
