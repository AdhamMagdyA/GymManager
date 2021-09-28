import 'package:flutter/material.dart';
import 'package:gym_project/models/set.dart';
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
  Future<void> fetchListSets() async {
    print('currently here!');
    List<Set> _sets = await SetWebService().getSets();
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

  Future<void> fetchSetDetails(int setId) async {
    print('id');
    print(setId);
    print('currently here!');
    Set _set = await SetWebService().getSetDetails(setId);
    loadingStatus = LoadingStatus.Searching;
    // not notifying listeners as it causes an error
    // since fetchSetDetails is called in initState, so the value of loadingStatus is set before widgets depending on that value are built
    // notifyListeners();
    Set setModel = await SetWebService().getSetDetails(setId);
    this.set = SetViewModel(set: setModel);

    loadingStatus = LoadingStatus.Completed;
    notifyListeners();
  }

  Future<void> postSet(Set set, String token) async {
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    Set setModel = await SetWebService().postSet(set, token);

    // adding the set to the sets list in the provider
    sets.add(SetViewModel(set: setModel));
    loadingStatus = LoadingStatus.Completed;
    notifyListeners();
  }

  Future<void> putSet(Set set, String token) async {
    // loadingStatus = LoadingStatus.Searching;
    // notifyListeners();
    // Set setModel =
    await SetWebService().putSet(set, token);

    editSetInProvider(set);
    loadingStatus = LoadingStatus.Completed;
    notifyListeners();
  }

  void editSetInProvider(Set set) {
    int updatedSetIndex = sets.indexWhere((s) => s.id == set.id);
    sets.removeAt(updatedSetIndex);
    sets.insert(updatedSetIndex, SetViewModel(set: set));
  }

  Future<void> deleteSet(Set set, String token) async {
    await SetWebService().deleteSet(set, token);
    _removeSetFromProvider(set);
    notifyListeners();
  }

  void _removeSetFromProvider(Set set) {
    sets.removeWhere((s) => s.id == set.id);
  }
}
