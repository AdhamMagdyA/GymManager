import 'dart:convert';
import 'package:gym_project/models/answer.dart';
import 'package:gym_project/models/answers.dart';
import 'package:gym_project/widget/global.dart';
import 'package:http/http.dart' as http;

String token = Global.token;

class AnswersWebservice {
  //get all answers
  Future<List<Answer>> fetchAllAnswers() async {
    final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/answers'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      Answers answers = Answers.fromJson(jsonData);
      return answers.answers.map((e) => Answer.fromJson(e)).toList();
    } else {
      throw Exception('Failed to download answers');
    }
  }

  //get all answers of a certain question
  Future<List<Answer>> fetchAnswers(int question_id) async {
    final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/questions/$question_id/answers'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      Answers answers = Answers.fromJson(jsonData);
      return answers.answers.map((e) => Answer.fromJson(e)).toList();
    } else {
      throw Exception('Failed to download answers');
    }
  }

  //get answer by id
  Future<Answer> fetchAnswerById(int id) async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/answers/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      Answer answer = Answer.fromJson(jsonData['answer']);
      return answer;
    } else {
      throw Exception('Failed to download question');
    }
  }

  //add answer to a question
  Future<void> postAnswer(int question_id, String body) async {
    print('adding answer');
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/answers/create'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'body': body,
        'question_id': question_id.toString(),
      }),
    );
  }

  //edit answer
  Future<void> editAnswer(int id, String body) async {
    print('editing answer');
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/answers/edit/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'body': body,
      }),
    );
  }

  //delete answer
  Future<void> deleteAnswer(int id) async {
    print('deleting answer');
    final response = await http.delete(
      Uri.parse('http://127.0.0.1:8000/api/answers/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
  }
}
