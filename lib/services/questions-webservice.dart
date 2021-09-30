import 'dart:convert';

import 'package:gym_project/models/question.dart';
import 'package:gym_project/models/questions.dart';
import 'package:gym_project/widget/global.dart';
import 'package:http/http.dart' as http;

String token = Global.token;

class QuestionsWebservice {
  //get all questions
  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/questions'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      Questions questions = Questions.fromJson(jsonData);
      return questions.questions.map((e) => Question.fromJson(e)).toList();
    } else {
      throw Exception('Failed to download announcements');
    }
  }

  //get question by id
  Future<Question> fetchQuestionById(int id) async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/questions/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      Question question = Question.fromJson(jsonData['question']);
      return question;
    } else {
      throw Exception('Failed to download question');
    }
  }

  //add question
  Future<void> postQuestion(String title, String body) async {
    print('adding question');
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/questions/create'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'body': body,
      }),
    );
  }

  //edit question
  Future<void> editQuestion(int id, String title, String body) async {
    print('editing question');
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/questions/edit/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'body': body,
      }),
    );
  }

  //delete question
  Future<void> deleteQuestion(int id) async {
    print('deleting question');
    final response = await http.delete(
      Uri.parse('http://127.0.0.1:8000/api/questions/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
  }
}
