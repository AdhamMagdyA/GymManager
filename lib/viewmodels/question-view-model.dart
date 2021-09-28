import 'package:gym_project/models/question.dart';
import 'package:intl/intl.dart';

class QuestionViewModel {
  Question _question;
  QuestionViewModel({Question question}) : _question = question;

  int get id => _question.id;
  int get user_id => _question.user_id;
  String get title => _question.title;
  String get body => _question.body;
  String get date =>
      DateFormat('yyyy-MM-dd').format(DateTime.parse(_question.date)) +
      ' at ' +
      DateFormat('kk:mm a').format(DateTime.parse(_question.date));
}
