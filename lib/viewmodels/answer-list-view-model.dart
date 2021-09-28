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
    List<Answer> _answers = await AnswersWebservice().fetchAllAnswers();
    loadingstatus = AnswerLoadingStatus.Searching;
    notifyListeners();
    this._answersList =
        _answers.map((e) => AnswerViewModel(answer: e)).toList();

    if (this._answersList.isEmpty) {
      loadingstatus = AnswerLoadingStatus.Empty;
    } else {
      loadingstatus = AnswerLoadingStatus.Completed;
    }
    notifyListeners();
  }

  getAnswers(int question_id) async {
    List<Answer> _answers = await AnswersWebservice().fetchAnswers(question_id);
    loadingstatus = AnswerLoadingStatus.Searching;
    notifyListeners();
    this._answersList =
        _answers.map((e) => AnswerViewModel(answer: e)).toList();

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
    loadingstatus = AnswerLoadingStatus.Completed;
    notifyListeners();
  }

  postAnswer(int question_id, String body) async {
    loadingstatus = AnswerLoadingStatus.Searching;
    notifyListeners();
    await AnswersWebservice().postAnswer(question_id, body);
    loadingstatus = AnswerLoadingStatus.Completed;
    notifyListeners();
  }

  editAnswer(int id, String body) async {
    loadingstatus = AnswerLoadingStatus.Searching;
    notifyListeners();
    await AnswersWebservice().editAnswer(id, body);
    loadingstatus = AnswerLoadingStatus.Completed;
    notifyListeners();
  }

  deletAnswer(int id) async {
    loadingstatus = AnswerLoadingStatus.Searching;
    notifyListeners();
    await AnswersWebservice().deleteAnswer(id);
    loadingstatus = AnswerLoadingStatus.Completed;
    notifyListeners();
  }

  List<AnswerViewModel> get answersList => _answersList;
  AnswerViewModel get answerById => _answerById;
}
