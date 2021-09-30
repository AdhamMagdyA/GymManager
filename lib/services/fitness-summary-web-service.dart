import 'dart:convert';

import 'package:gym_project/models/fitness-summary.dart';
import 'package:gym_project/models/tuple.dart';
import 'package:gym_project/widget/global.dart';
import 'package:http/http.dart' as http;

class FitnessSummaryWebService {
  String token = Global.token;
  Future<Tuple<int, List<FitnessSummary>>> getFitnessSummaries(
      int page, String startDate, String endDate) async {
    Tuple<int, List<FitnessSummary>> res = Tuple();
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/fitness_summaries?page=$page'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final result = json.decode(response.body);
    print(result);
    res.item1 = result['fitness summaries']['last_page'];
    if (response.statusCode == 200) {
      Iterable list = result['fitness summaries']['data'];
      res.item2 = list
          .map((fitnessSummary) => FitnessSummary.fromJson(fitnessSummary))
          .toList();
      return res;
    } else {
      throw Exception('response failed');
    }
  }

  Future<FitnessSummary> getFitnessSummary(int fitnessId) async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/fitness_summaries/$fitnessId'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      return FitnessSummary.fromJson(result['fitness summary']);
    } else {
      throw Exception('response failed');
    }
  }

  Future<bool> deleteFitnessSummary(int fitnessId) async {
    final response = await http.delete(
      Uri.parse('http://localhost:8000/api/fitness_summaries/$fitnessId'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final result = json.decode(response.body);
    print(result);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('response failed');
    }
  }

  Future<bool> postFitnessSummary(FitnessSummary fitSum) async {
    final response = await http.post(
        Uri.parse('http://localhost:8000/api/fitness_summaries/create'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'BMI': fitSum.BMI,
          'weight': fitSum.weight,
          'muscle_ratio': fitSum.muscleRatio,
          'height': fitSum.height,
          'fat_ratio': fitSum.fatRatio,
          'fitness_ratio': fitSum.fitnessRatio,
          'total_body_water': fitSum.totalBodyWater,
          'dry_lean_bath': fitSum.dryLeanBath,
          'body_fat_mass': fitSum.bodyFatMass,
          'opacity_ratio': fitSum.opacityRatio,
          'protein': fitSum.protein,
          'SMM': fitSum.SMM,
          'member_id': fitSum.memberId,
        }));
    print('response obtained!');
    print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('response failed');
    }
  }
}
