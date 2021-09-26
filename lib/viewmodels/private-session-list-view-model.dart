import 'package:flutter/material.dart';
import 'package:gym_project/models/privateSession.dart';
import 'package:gym_project/services/private-session-webservice.dart';
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
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjMyMzk1ODIwLCJleHAiOjE2MzI0ODIyMjAsIm5iZiI6MTYzMjM5NTgyMCwianRpIjoiNFk0VTJPTmtFV29vUFU1MCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.GVP5rxrQOcXilWAaISwj-dsPh0a9hWDsQIO_L1L50lI';
  // PrivateSessionListViewModel({this.token});
  // void update(token) {
  //   token = token;
  //   webService.token = token;
  //   notifyListeners();
  // }

  // ignore: deprecated_member_use
  List<PrivateSessionViewModel> privateSessions =
      List<PrivateSessionViewModel>();
  PrivateSessionViewModel privateSession = PrivateSessionViewModel();
  // methods to fetch news
  Future<void> fetchListMyPrivateSessions(String tokenn) async {
    // print('welcome token! $tokenn');
    // print('currently here!');
    List<PrivateSession> _privateSessions =
        await webService.getMyPrivateSessions(tokenn);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.privateSessions = _privateSessions
        .map((privateSession) =>
            PrivateSessionViewModel(privateS: privateSession))
        .toList();

    if (this.privateSessions.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> fetchListBookedPrivateSessions(String tokenn) async {
    // print('welcome token! $tokenn');
    // print('currently here!');
    List<PrivateSession> _privateSessions =
        await webService.getBookedPrivateSessions(tokenn);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.privateSessions = _privateSessions
        .map((privateSession) =>
            PrivateSessionViewModel(privateS: privateSession))
        .toList();

    if (this.privateSessions.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> fetchListPrivateSessions(String tokenn) async {
    // print('welcome token! $tokenn');
    // print('currently here!');
    List<PrivateSession> _privateSessions =
        await webService.getPrivateSessions(tokenn);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.privateSessions = _privateSessions
        .map((privateSession) =>
            PrivateSessionViewModel(privateS: privateSession))
        .toList();

    if (this.privateSessions.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }

  Future<void> fetchPrivateSession(int privateSessionId, String tokenn) async {
    print(privateSessionId);
    print('currently here!');
    // print('welcome token! $tokenn');
    PrivateSession _privateSession =
        await webService.getPrivateSessionDetails(privateSessionId, tokenn);
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

  // Future<void> postprivateSession(privateSession privateSession, String tokenn) async {
  //   // print('currently here!');
  //   privateSession _privateSession = await webService.postprivateSession(privateSession, tokenn);
  //   if (_privateSession == null) {
  //     loadingStatus = LoadingStatus.Error;
  //   }
  //   loadingStatus = LoadingStatus.Searching;
  //   notifyListeners();
  //   this.privateSession = PrivateSessionViewModel(e: _privateSession);

  //   if (this.privateSession == null) {
  //     loadingStatus = LoadingStatus.Empty;
  //   } else {
  //     loadingStatus = LoadingStatus.Completed;
  //   }
  //   notifyListeners();
  // }

  // Future<void> editprivateSession(PrivateSessionViewModel privateSession, String tokenn) async {
  //   // print('currently here!');
  //   privateSession _privateSession = await webService.editprivateSession(privateSession, tokenn);
  //   if (_privateSession == null) {
  //     loadingStatus = LoadingStatus.Error;
  //   }
  //   loadingStatus = LoadingStatus.Searching;
  //   notifyListeners();
  //   this.privateSession = PrivateSessionViewModel(e: _privateSession);

  //   if (this.privateSession == null) {
  //     loadingStatus = LoadingStatus.Empty;
  //   } else {
  //     loadingStatus = LoadingStatus.Completed;
  //   }
  //   notifyListeners();
  // }

  Future<void> deletePrivateSession(int sessionId, String tokenn) async {
    // print('currently here!');
    bool status = await webService.deletePrivateSession(sessionId, tokenn);
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
