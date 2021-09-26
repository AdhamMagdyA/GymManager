import 'package:flutter/cupertino.dart';
import 'package:gym_project/models/answer.dart';
import 'package:gym_project/services/answers-webservice.dart';
import 'package:gym_project/viewmodels/answer-view-model.dart';

enum AnswerLoadingStatus {
  Completed,
  Searching,
  Empty,
}

class AnswerListViewModel with ChangeNotifier {
  AnswerLoadingStatus loadingstatus = AnswerLoadingStatus.Empty;
  List<AnswerViewModel> _answersList = <AnswerViewModel>[];
  AnswerViewModel _answerById;

  getAllAnswers() async {
    List<Answer> _questions = await AnswersWebservice().fetchAllAnswers();
    loadingstatus = AnswerLoadingStatus.Searching;
    notifyListeners();
    this._answersList =
        _questions.map((e) => AnswerViewModel(answer: e)).toList();

    if (this._answersList.isEmpty) {
      loadingstatus = AnswerLoadingStatus.Empty;
    } else {
      loadingstatus = AnswerLoadingStatus.Completed;
    }
    notifyListeners();
  }

  getAnswers(int question_id) async {
    List<Answer> _questions =
        await AnswersWebservice().fetchAnswers(question_id);
    loadingstatus = AnswerLoadingStatus.Searching;
    notifyListeners();
    this._answersList =
        _questions.map((e) => AnswerViewModel(answer: e)).toList();

    if (this._answersList.isEmpty) {
      loadingstatus = AnswerLoadingStatus.Empty;
    } else {
      loadingstatus = AnswerLoadingStatus.Completed;
    }
    notifyListeners();
  }

  getAnswerById(int id) async {
    Answer _answer = await AnswersWebservice().fetchAnswerById(id);
    loadingstatus = AnswerLoadingStatus.Searching;
    notifyListeners();
    this._answerById = AnswerViewModel(answer: _answer);
    notifyListeners();
  }

  postAnswer(int question_id, String body) async {
    await AnswersWebservice().postAnswer(question_id, body);
    notifyListeners();
  }

  editAnswer(int id, String body) async {
    await AnswersWebservice().editAnswer(id, body);
    notifyListeners();
  }

  deletAnswer(int id) async {
    await AnswersWebservice().deleteAnswer(id);
    notifyListeners();
  }

  List<AnswerViewModel> get answersList => _answersList;
  AnswerViewModel get answerById => _answerById;
}
