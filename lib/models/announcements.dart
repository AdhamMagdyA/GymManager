class Announcements {
  final List<dynamic> announcements;
  Announcements({this.announcements});
  factory Announcements.fromJson(Map<String, dynamic> jsonData) {
    return Announcements(announcements: jsonData['announcments']);
  }
}
