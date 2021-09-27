import 'dart:convert';

import 'package:gym_project/models/privateSession.dart';
import 'package:gym_project/models/tuple.dart';
import 'package:gym_project/viewmodels/private-session-view-model.dart';

import 'package:http/http.dart' as http;

class PrivateSessionWebService {
  // String token;
  // PrivateSessionWebService({this.token});
  Future<List<PrivateSession>> getMyPrivateSessions(String token) async {
    print('Am i here??');
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/sessions/index'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions'];
      // print(list);
      List<PrivateSession> privateSessions = list
          .map<PrivateSession>(
              (privateSession) => PrivateSession.fromJson(privateSession))
          .toList();
      List<PrivateSession> newPrivateSessions =
          privateSessions.cast<PrivateSession>().toList();
      return newPrivateSessions;
    } else {
      // print(result.msg);
      throw Exception('response failed');
    }
  }

  Future<List<PrivateSession>> getBookedPrivateSessions(String token) async {
    print('Am i here??');
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/sessions/booked'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions'];
      // print(list);
      List<PrivateSession> privateSessions = list
          .map<PrivateSession>(
              (privateSession) => PrivateSession.fromJson(privateSession))
          .toList();
      List<PrivateSession> newPrivateSessions =
          privateSessions.cast<PrivateSession>().toList();
      return newPrivateSessions;
    } else {
      // print(result.msg);
      throw Exception('response failed');
    }
  }

  Future<Tuple<int, List<PrivateSession>>> getPrivateSessions(
      String token, int page) async {
    print('Am i here??');
    Tuple res = Tuple();
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/sessions?page=$page'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    res.item1 = result['last_page'];
    print(result);
    if (response.statusCode == 200) {
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions'];
      // print(list);
      List<PrivateSession> privateSessions = list
          .map<PrivateSession>(
              (privateSession) => PrivateSession.fromJson(privateSession))
          .toList();
      List<PrivateSession> newPrivateSessions =
          privateSessions.cast<PrivateSession>().toList();
      res.item2 = newPrivateSessions;
      return res;
    } else {
      // print(result.msg);
      throw Exception('response failed');
    }
  }

  Future<PrivateSession> getPrivateSessionDetails(
      int sessionId, String token) async {
    print('Am i here??');
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/sessions/$sessionId/details'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    if (response.statusCode == 200) {
      final privateSessionJson = result['Private Session'];
      return PrivateSession.fromJson(privateSessionJson);
    } else {
      print(result);
      throw Exception('response failed');
    }
  }

  Future<bool> deletePrivateSession(int sessionId, String token) async {
    // print('Am i here??');
    final response = await http.delete(
      Uri.parse('http://localhost:8000/api/sessions/$sessionId'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('response obtained!');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('response failed');
    }
  }

  Future<bool> postPrivateSession(
      PrivateSession privateSession, String token) async {
    // print('Am i here??');
    final response =
        await http.post(Uri.parse('http://localhost:8000/api/sessions'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              'title': privateSession.title,
              'description': privateSession.description,
              'duration': privateSession.duration,
              'price': privateSession.price,
              'link': privateSession.link,
            }));
    print('response obtained!');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('response failed');
    }
  }

  Future<bool> editPrivateSession(
      PrivateSessionViewModel privateSession, String token) async {
    // print('Am i here??');
    final response = await http.put(
        Uri.parse('http://localhost:8000/api/sessions/${privateSession.id}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'title': privateSession.title,
          'description': privateSession.description,
          'duration': privateSession.duration,
          'price': privateSession.price,
          'link': privateSession.link,
        }));
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('response failed');
    }
  }
}
