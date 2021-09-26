import 'dart:convert';
import 'package:gym_project/models/announcement.dart';
import 'package:gym_project/models/announcements.dart';
import 'package:http/http.dart' as http;

const token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vZ3ltcHJvamVjdC50ZXN0L2FwaS9sb2dpbiIsImlhdCI6MTYzMjY0MjYzNywiZXhwIjoxNjMyNzI5MDM3LCJuYmYiOjE2MzI2NDI2MzcsImp0aSI6IlBIRTh6cThadGZQNVpXdXYiLCJzdWIiOjIzLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.bPYsQmnYY4xZsLzpp2QouAkFWu4a5hdxMeiaii6ClE4';

class AnnouncementsWebservice {
  //get all announcements
  Future<List<Announcement>> fetchAnnouncements() async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/announcements'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      Announcements announcements = Announcements.fromJson(jsonData);
      return announcements.announcements
          .map((e) => Announcement.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to download announcements');
    }
  }

  //get announcement by id
  Future<Announcement> fetchAnnouncementById(int id) async {
    final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/announcements/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      Announcement announcement = Announcement.fromJson(jsonData);
      return announcement;
    } else {
      throw Exception('Failed to download announcement');
    }
  }

  //add announcement
  Future<void> postAnnouncement(
      String title, String description, String date) async {
    print('adding announcement');
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/announcements/create'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'description': description,
        'datetime': date,
        'sender_id': "1",
        'receiver_type': 'all'
      }),
    );
  }

  //edit announcement
  Future<void> editAnnouncement(
      int id, String title, String description, String date) async {
    print('editing announcement');
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/announcements/edit/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'description': description,
        'datetime': date,
        'sender_id': "1",
        'receiver_type': 'all'
      }),
    );
  }

  //delete announcement
  Future<void> deleteAnnouncement(int id) async {
    print('deleting announcement');
    final response = await http.delete(
      Uri.parse('http://127.0.0.1:8000/api/announcements/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
  }
}
