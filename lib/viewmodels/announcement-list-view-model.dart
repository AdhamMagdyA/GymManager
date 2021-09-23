import 'package:flutter/cupertino.dart';
import 'package:gym_project/models/announcement.dart';
import 'package:gym_project/services/announcements-webservice.dart';
import 'package:gym_project/viewmodels/announcement-view-model.dart';
import 'package:gym_project/viewmodels/login-view-model.dart';

enum AnnouncementLoadingStatus {
  Completed,
  Searching,
  Empty,
}

class AnnouncementListViewModel with ChangeNotifier {
  AnnouncementLoadingStatus loadingstatus = AnnouncementLoadingStatus.Empty;
  List<AnnouncementViewModel> _announcementsList = <AnnouncementViewModel>[];

  getAnnouncements() async {
    List<Announcement> _announcements =
        await AnnouncementsWebservice().fetchAnnouncements();
    loadingstatus = AnnouncementLoadingStatus.Searching;
    notifyListeners();
    this._announcementsList = _announcements
        .map((e) => AnnouncementViewModel(announcement: e))
        .toList();

    if (this._announcementsList.isEmpty) {
      loadingstatus = AnnouncementLoadingStatus.Empty;
    } else {
      loadingstatus = AnnouncementLoadingStatus.Completed;
    }

    notifyListeners();
  }

  getAnnouncementById(int id) async {
    Announcement _announcement =
        await AnnouncementsWebservice().fetchAnnouncementById(id);
    loadingstatus = AnnouncementLoadingStatus.Searching;
    notifyListeners();

    if (this._announcementsList.isEmpty) {
      loadingstatus = AnnouncementLoadingStatus.Empty;
    } else {
      loadingstatus = AnnouncementLoadingStatus.Completed;
    }

    notifyListeners();
  }

  postAnnouncement(String title, String description, String date) async {
    await AnnouncementsWebservice().postAnnouncement(title, description, date);
    notifyListeners();
  }

  editAnnouncement(
      int id, String title, String description, String date) async {
    await AnnouncementsWebservice()
        .editAnnouncement(id, title, description, date);
    notifyListeners();
  }

  deleteAnnouncement(int id) async {
    await AnnouncementsWebservice().deleteAnnouncement(id);
  }

  List<AnnouncementViewModel> get announcementList => _announcementsList;
}
