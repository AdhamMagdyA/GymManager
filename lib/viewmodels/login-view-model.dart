import 'package:flutter/material.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/login.dart';
import 'package:gym_project/services/login-auth-webservice.dart';
import 'package:gym_project/services/webservice.dart';

import 'exercise-view-model.dart';

enum LoadingStatus {
  Completed,
  Searching,
  Empty,
}

class LoginViewModel with ChangeNotifier {
  Login login = Login();

  String get token {
    return login.token;
  }

  String get role {
    return login.role;
  }

  LoadingStatus loadingStatus = LoadingStatus.Empty;

  Future<void> fetchLogin(String email, String password) async {
    login = await LoginAuthWebService().postLogin(email, password);
    loadingStatus = LoadingStatus.Searching;

    if (this.login != null) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }
}
