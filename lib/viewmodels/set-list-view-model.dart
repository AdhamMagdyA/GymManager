import 'package:flutter/material.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/services/webservice.dart';
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
  void fetchListSets() async {
    print('currently here!');
    List<Set> _sets = await WebService().getSets();
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

  void fetchSetDetails(int setId) async {
    print('id');
    print(setId);
    print('currently here!');
    Set _set = await WebService().getSetDetails(setId);
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
}
