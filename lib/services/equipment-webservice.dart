import 'dart:convert';

import 'package:gym_project/models/equipment.dart';
import 'package:http/http.dart' as http;

class EquipmentWebService {
  Future<List<Equipment>> getEquipments() async {
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/equipments/getAll'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result['equipment']['data'];
      return list.map((equipment) => Equipment.fromJson(equipment)).toList();
    } else {
      throw Exception('response failed');
    }
  }
}
