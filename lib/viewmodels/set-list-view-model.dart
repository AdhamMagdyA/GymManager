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
    this.sets = _sets.map((set) => SetViewModel(set: set)).toList();

    if (this.sets.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  void fetchSetDetails(int setId, String token) async {
    loadingStatus = LoadingStatus.Searching;
    // not notifying listeners as it causes an error
    // since fetchSetDetails is called in initState, so the value of loadingStatus is set before widgets depending on that value are built
    // notifyListeners();
    print('id');
    print(setId);
    print('currently here!');
    Set setModel = await SetWebService().getSetDetails(setId, token);
    this.set = SetViewModel(set: setModel);
    print(set.id);

    loadingStatus = LoadingStatus.Completed;
    notifyListeners();
  }

  void postSet(Set set, String token) async {
    Set setModel = await SetWebService().postSet(set, token);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.set = SetViewModel(set: setModel);

    if (this.set == null) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> putSet(Set set, String token) async {
    // loadingStatus = LoadingStatus.Searching;
    // notifyListeners();
    // Set setModel =
    await SetWebService().putSet(set, token);
    // this.set = SetViewModel(set: setModel);

    loadingStatus = LoadingStatus.Completed;

    print('this line runs #1');

    notifyListeners();
  }

  Future<void> deleteSet(Set set, String token) async {
    await SetWebService().deleteSet(set, token);
    notifyListeners();
  }
}
