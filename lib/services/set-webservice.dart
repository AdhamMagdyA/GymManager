import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/viewmodels/set-view-model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjMyMTI2Mjg1LCJleHAiOjE2MzIyMTI2ODUsIm5iZiI6MTYzMjEyNjI4NSwianRpIjoicXU5WFFpYk11RDNrY1p0RCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.8lXi7qmanXGwGcfAsG8gqAho5E7v5smfeNYocQHSqPw';

class SetWebService {
  Future<List<Set>> getSets() async {
    print('Am i here??');
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/sets'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('response obtained!');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result['sets'];
      List<Set> sets = list.map<Set>((set) => Set.fromJson(set)).toList();
      List<Set> newSets = sets.cast<Set>().toList();
      return newSets;
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
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final setJson = result['set'];
      return Set.detailsfromJson(setJson);
    } else {
      throw Exception('response failed');
    }
  }

  Future<Set> postSet(Set set) async {
    final response =
        await http.post(Uri.parse('http://localhost:8000/api/sets'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              'title': set.title,
              'description': set.description,
              //parse exercises!
              // 'exercises': {
              //   {
              //     'id':
              //   }
            }));
    print('response obtained!');
    print(response.statusCode);
    if (response.statusCode == 201) {
      final result = json.decode(response.body);
      final exerciseJson = result['set'];
      return Set.detailsfromJson(exerciseJson);
    } else {
      throw Exception('response failed');
    }
  }
}
