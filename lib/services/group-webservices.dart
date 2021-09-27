import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:gym_project/models/group.dart';

class GroupWebService {
  Future<List<Group>> getGroups(String token) async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/groups'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    var body = json.decode(response.body);
    List<dynamic> jsonGroups = body['groups'];
    List<Group> groups =
        jsonGroups.map((group) => Group.fromJson(group)).toList();
    return groups;
  }

  Future<Group> getGroupDetails(int groupId, String token) async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/groups/$groupId/details'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    var body = json.decode(response.body);
    Group group = Group.detailsFromJson(body);
    return group;
  }
}
