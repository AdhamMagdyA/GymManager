import 'package:flutter/material.dart';
import 'package:gym_project/models/equipment.dart';
import 'package:gym_project/services/equipment-webservice.dart';
import 'package:gym_project/viewmodels/equipment-view-model.dart';

import 'exercise-view-model.dart';

enum LoadingStatus {
  Completed,
  Searching,
  Empty,
}

class EquipmentListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.Empty;

  // ignore: deprecated_member_use
  List<EquipmentViewModel> equipments = List<EquipmentViewModel>();
  EquipmentViewModel equipment;

  // methods to fetch news
  void fetchListEquipments() async {
    List<Equipment> _equipments = await EquipmentWebService().getEquipments();
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.equipments = _equipments
        .map((equipment) => EquipmentViewModel(e: equipment))
        .toList();

    if (this.equipment == null) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }
}
