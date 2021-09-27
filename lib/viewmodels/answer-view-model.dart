import 'package:gym_project/models/answer.dart';
import 'package:intl/intl.dart';

class AnswerViewModel {
  Answer _answer;
  AnswerViewModel({Answer answer}) : _answer = answer;

  int get id => _answer.id;
  int get user_id => _answer.user_id;
  int get question_id => _answer.question_id;
  String get body => _answer.body;
  String get date =>
      DateFormat('yyyy-MM-dd').format(DateTime.parse(_answer.date)) +
      ' at ' +
      DateFormat('kk:mm a').format(DateTime.parse(_answer.date));
}
