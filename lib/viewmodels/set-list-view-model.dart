import 'package:flutter/material.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/services/exercise-webservice.dart';
import 'package:gym_project/services/set-webservice.dart';
import 'package:gym_project/viewmodels/set-view-model.dart';

enum LoadingStatus {
  Completed,
  Searching,
  Empty,
}

class SetListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.Empty;

  // ignore: deprecated_member_use
  List<SetViewModel> sets = List<SetViewModel>();
  SetViewModel set;

  // methods to fetch news
  Future<void> fetchListSets(String token) async {
    print('currently here!');
    List<Set> _sets = await SetWebService().getSets(token);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.sets = _sets.map((set) => SetViewModel(s: set)).toList();

    if (this.sets.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  void fetchSetDetails(int setId, String token) async {
    print('id');
    print(setId);
    print('currently here!');
    Set _set = await SetWebService().getSetDetails(setId, token);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.set = SetViewModel(s: _set);
    print(set.id);

    if (this.sets.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  void postSet(Set set, String token) async {
    Set _set = await SetWebService().postSet(set, token);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.set = SetViewModel(s: _set);

    if (this.set == null) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }
}
