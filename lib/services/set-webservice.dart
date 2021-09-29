import 'package:gym_project/models/set.dart';
import 'package:gym_project/models/tuple.dart';

import 'package:gym_project/widget/global.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SetWebService {
  String token = Global.token;
  Future<Tuple<int, List<Set>>> getSets(int page) async {
    print(token);
    print('Am i here??');
    Tuple<int, List<Set>> res = Tuple();
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/sets?page=$page'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    final result = json.decode(response.body);
    print(result);
    String userName = result['data']['name'];
    Global.setUserName(userName);
    if (response.statusCode == 200) {
      res.item1 = result['data']['sets']['last_page'];
      Iterable list = result['data']['sets']['data'];
      print(list);
      List<Set> sets = list.map<Set>((set) => Set.fromJson(set)).toList();
      List<Set> newSets = sets.cast<Set>().toList();
      res.item2 = newSets;
      return res;
    } else {
      throw Exception('response failed');
    }
  }

  Future<Set> getSetDetails(int setId) async {
    print('Am i here??');
    final response = await http.get(
        Uri.parse('http://localhost:8000/api/sets/$setId/details'),
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
      final setJson = result['set'];
      return Set.detailsfromJson(setJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<Set> postSet(Set set, String token) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/sets'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: set.toJsonForCreation(),
    );
    print('response obtained!');
    print(response.body);
    if (response.statusCode == 201) {
      final result = json.decode(response.body);
      final exerciseJson = result['set'];
      return Set.fromJson(exerciseJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<Set> putSet(Set set, String token) async {
    final response = await http.put(
      Uri.parse('http://localhost:8000/api/sets/${set.id}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: set.toJsonForCreation(),
    );
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final setJson = result['set'];
      return Set.fromJson(setJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<void> deleteSet(Set set, String token) async {
    final response = await http.delete(
      Uri.parse('http://127.0.0.1:8000/api/sets/${set.id}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('response failed');
    }
  }
}
