import 'dart:convert';

import 'package:gym_project/models/privatesession.dart';
import 'package:gym_project/models/tuple.dart';
import 'package:gym_project/viewmodels/private-session-view-model.dart';
import 'package:gym_project/widget/global.dart';

import 'package:http/http.dart' as http;

class PrivateSessionWebService {
  String token = Global.token;
  // PrivateSessionWebService({this.token});
  Future<Tuple<int, List<PrivateSession>>> getMyPrivateSessions(
      int page) async {
    print('Am i here??');
    Tuple<int, List<PrivateSession>> res = Tuple();
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/sessions/index?page=$page'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    res.item1 = result['Private Sessions']['last_page'];
    print(result);
    if (response.statusCode == 200) {
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions']['data'];
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

  Future<Tuple<int, List<PrivateSession>>> getBookedPrivateSessions(
      String role, int page) async {
    Tuple<int, List<PrivateSession>> res = Tuple();
    print('Am i here??');
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/sessions/booked?page=$page'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      res.item1 = result['Private Sessions']['last_page'];
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions']['data'];
      List<PrivateSession> privateSessions = [];
      // print(list);

      privateSessions = list
          .map<PrivateSession>((privateSession) =>
              PrivateSession.fromJsonwithDate(privateSession))
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

  Future<Tuple<int, List<PrivateSession>>> getPrivateSessions(int page) async {
    print('Am i here??');
    Tuple<int, List<PrivateSession>> res = Tuple();
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
    print(result);
    if (response.statusCode == 200) {
      res.item1 = result['Private Sessions']['last_page'];
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions']['data'];
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

  Future<Tuple<int, List<PrivateSession>>> getRequestedPrivateSessions(
      int page) async {
    print('Am i here??');
    Tuple<int, List<PrivateSession>> res = Tuple();
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/sessions/requests?page=$page'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      res.item1 = result['Private Sessions']['last_page'];
      // Iterable list = result['private_sessions']['data'];
      Iterable list = result['Private Sessions']['data'];
      // print(list);
      List<PrivateSession> privateSessions = list
          .map<PrivateSession>(
              (privateSession) => PrivateSession.fromJsonAdmin(privateSession))
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

  Future<PrivateSession> getPrivateSessionDetails(int sessionId) async {
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

  Future<bool> deletePrivateSession(int sessionId) async {
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

  Future<bool> postPrivateSession(PrivateSession privateSession) async {
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
    PrivateSessionViewModel privateSession,
  ) async {
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

  Future<bool> requestSession(
    int sessionId,
  ) async {
    // print('Am i here??');
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/sessions/$sessionId/request'),
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
    } else if (response.statusCode == 400) {
      throw Exception('Session already requested!');
    } else {
      throw Exception('Failed to request!');
    }
  }

  Future<bool> cancelSession(
    int sessionId,
  ) async {
    // print('Am i here??');
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/sessions/$sessionId/cancel'),
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

  Future<bool> acceptSession(
    PrivateSessionViewModel privateSession,
  ) async {
    // print('Am i here??');
    final response = await http.post(
        Uri.parse(
            'http://localhost:8000/api/sessions/${privateSession.id}/accept'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'member': privateSession.memberName,
          'datetime': privateSession.dateTime,
        }));
    print('response obtained!');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('response failed');
    }
  }

  Future<bool> rejectSession(
    PrivateSessionViewModel privateSession,
  ) async {
    // print('Am i here??');
    final response = await http.post(
        Uri.parse(
            'http://localhost:8000/api/sessions/${privateSession.id}/reject'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'member': privateSession.memberName,
        }));
    print('response obtained!');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('response failed');
    }
  }
}
