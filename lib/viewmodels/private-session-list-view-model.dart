import 'package:flutter/material.dart';
import 'package:gym_project/models/privatesession.dart';
import 'package:gym_project/models/tuple.dart';
import 'package:gym_project/services/private-session-webservice.dart';
import 'package:gym_project/viewmodels/private-session-view-model.dart';

enum LoadingStatus {
  Completed,
  Searching,
  Empty,
  Error,
}
var generalToken;

class PrivateSessionListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.Empty;

  PrivateSessionWebService webService = PrivateSessionWebService();
  int lastPage;

  // ignore: deprecated_member_use
  List<PrivateSessionViewModel> privateSessions =
      // ignore: deprecated_member_use
      List<PrivateSessionViewModel>();
  PrivateSessionViewModel privateSession = PrivateSessionViewModel();
  // methods to fetch news
  Future<void> fetchListMyPrivateSessions(int page, String searchText) async {
    // print('welcome token! $tokenn');
    // print('currently here!');
    Tuple<int, List<PrivateSession>> result =
        await webService.getMyPrivateSessions(page, searchText);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.privateSessions = result.item2
        .map((privateSession) =>
            PrivateSessionViewModel(privateS: privateSession))
        .toList();
    this.lastPage = result.item1;
    if (this.privateSessions.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> fetchListBookedPrivateSessions(
      String role, int page, String searchText) async {
    Tuple<int, List<PrivateSession>> result =
        await webService.getBookedPrivateSessions(role, page, searchText);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.privateSessions = result.item2
        .map((privateSession) =>
            PrivateSessionViewModel(privateS: privateSession))
        .toList();
    this.lastPage = result.item1;
    if (this.privateSessions.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> fetchListPrivateSessions(int page, String searchText) async {
    Tuple<int, List<PrivateSession>> result =
        await webService.getPrivateSessions(page, searchText);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.privateSessions = result.item2
        .map((privateSession) =>
            PrivateSessionViewModel(privateS: privateSession))
        .toList();
    this.lastPage = result.item1;
    if (this.privateSessions.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> fetchListRequestedPrivateSessions(
      int page, String searchText) async {
    Tuple<int, List<PrivateSession>> result =
        await webService.getRequestedPrivateSessions(page, searchText);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.privateSessions = result.item2
        .map((privateSession) =>
            PrivateSessionViewModel(privateS: privateSession))
        .toList();
    this.lastPage = result.item1;
    if (this.privateSessions.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> fetchPrivateSession(
    int privateSessionId,
  ) async {
    print(privateSessionId);
    print('currently here!');
    // print('welcome token! $tokenn');
    PrivateSession _privateSession = await webService.getPrivateSessionDetails(
      privateSessionId,
    );
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.privateSession = PrivateSessionViewModel(privateS: _privateSession);
    print(privateSession.id);

    if (this.privateSession == null) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> postPrivateSession(
    PrivateSession privateSession,
  ) async {
    // print('currently here!');
    bool status = await webService.postPrivateSession(
      privateSession,
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

  Future<void> editPrivateSession(
    PrivateSessionViewModel privateSession,
  ) async {
    // print('currently here!');
    bool status = await webService.editPrivateSession(
      privateSession,
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

  Future<void> deletePrivateSession(int sessionId) async {
    // print('currently here!');
    bool status = await webService.deletePrivateSession(sessionId);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();

    if (status == false) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }

  Future<void> requestPrivateSession(
    int sessionId,
  ) async {
    // print('currently here!');
    bool status = await webService.requestSession(sessionId);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();

    if (status == false) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }

  Future<void> cancelPrivateSession(
    int sessionId,
  ) async {
    // print('currently here!');
    bool status = await webService.cancelSession(sessionId);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();

    if (status == false) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }

  Future<void> acceptPrivateSession(
    PrivateSessionViewModel privateSession,
  ) async {
    // print('currently here!');
    bool status = await webService.acceptSession(privateSession);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();

    if (status == false) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }

  Future<void> rejectPrivateSession(
    PrivateSessionViewModel privateSession,
  ) async {
    // print('currently here!');
    bool status = await webService.rejectSession(privateSession);
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
