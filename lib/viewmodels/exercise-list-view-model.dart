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
var generalToken;

class ExerciseListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.Empty;

  ExerciseWebService webService = ExerciseWebService();
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjMyMzk1ODIwLCJleHAiOjE2MzI0ODIyMjAsIm5iZiI6MTYzMjM5NTgyMCwianRpIjoiNFk0VTJPTmtFV29vUFU1MCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.GVP5rxrQOcXilWAaISwj-dsPh0a9hWDsQIO_L1L50lI';
  // ExerciseListViewModel({this.token});
  // void update(token) {
  //   token = token;
  //   webService.token = token;
  //   notifyListeners();
  // }

  // ignore: deprecated_member_use
  List<ExerciseViewModel> exercises = List<ExerciseViewModel>();
  ExerciseViewModel exercise = ExerciseViewModel();
  // methods to fetch news
  Future<void> fetchListExercises(String tokenn) async {
    // print('welcome token! $tokenn');
    // print('currently here!');
    List<Exercise> _exercises = await webService.getExercises(tokenn);
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

  Future<void> fetchExercise(int exerciseId, String tokenn) async {
    print(exerciseId);
    print('currently here!');
    // print('welcome token! $tokenn');
    Exercise _exercise =
        await webService.getExerciseDetails(exerciseId, tokenn);
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

  Future<void> postExercise(Exercise exercise, String tokenn) async {
    // print('currently here!');
    Exercise _exercise = await webService.postExercise(exercise, tokenn);
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

  Future<void> editExercise(ExerciseViewModel exercise, String tokenn) async {
    // print('currently here!');
    Exercise _exercise = await webService.editExercise(exercise, tokenn);
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

  Future<void> deleteExercise(int exerciseId, String tokenn) async {
    // print('currently here!');
    bool status = await webService.deleteExercise(exerciseId, tokenn);
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
