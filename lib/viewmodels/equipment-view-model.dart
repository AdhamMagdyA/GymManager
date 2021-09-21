import 'package:gym_project/models/equipment.dart';

class EquipmentViewModel {
  Equipment equipment;

  String get name {
    return equipment.name;
  }
  
  String get description {
    return equipment.description;
  }

  String get picture {
    return equipment.picture;
  }
}
