import 'package:gym_project/models/equipment.dart';
import 'package:gym_project/models/privateSession.dart';

class PrivateSessionViewModel {
  PrivateSession privateSession = PrivateSession();

  PrivateSessionViewModel({PrivateSession privateS})
      : privateSession = privateS;
  String get title {
    return privateSession.title;
  }

  set title(title) {
    privateSession.title = title;
  }

  int get id {
    return privateSession.id;
  }

  set id(id) {
    privateSession.id = id;
  }

  String get description {
    return privateSession.description;
  }

  set description(description) {
    privateSession.description = description;
  }

  String get duration {
    return privateSession.duration;
  }

  set duration(duration) {
    privateSession.duration = duration;
  }

  int get coachId {
    return privateSession.coachId;
  }

  set coachId(coachId) {
    privateSession.coachId = coachId;
  }

  String get coachName {
    return privateSession.coachName;
  }

  set coachName(coachName) {
    privateSession.coachName = coachName;
  }

  String get link {
    return privateSession.link;
  }

  set link(link) {
    privateSession.link = link;
  }

  double get price {
    return privateSession.price;
  }

  set price(price) {
    privateSession.price = price;
  }
}
