import 'package:flutter/cupertino.dart';
import 'package:gym_project/models/question.dart';
import 'package:gym_project/services/questions-webservice.dart';
import 'package:gym_project/viewmodels/question-view-model.dart';

enum QuestionLoadingStatus {
  Completed,
  Searching,
  Empty,
}

class QuestionListViewModel with ChangeNotifier {
  QuestionLoadingStatus loadingstatus = QuestionLoadingStatus.Empty;
  List<QuestionViewModel> _questionsList = <QuestionViewModel>[];
  QuestionViewModel _questionById;

  getQuestions() async {
    List<Question> _questions = await QuestionsWebservice().fetchQuestions();
    loadingstatus = QuestionLoadingStatus.Searching;
    notifyListeners();
    this._questionsList =
        _questions.map((e) => QuestionViewModel(question: e)).toList();

    if (this._questionsList.isEmpty) {
      loadingstatus = QuestionLoadingStatus.Empty;
    } else {
      loadingstatus = QuestionLoadingStatus.Completed;
    }
    notifyListeners();
  }

  getQuestionById(int id) async {
    Question _question = await QuestionsWebservice().fetchQuestionById(id);
    loadingstatus = QuestionLoadingStatus.Searching;
    notifyListeners();
    this._questionById = QuestionViewModel(question: _question);
    loadingstatus = QuestionLoadingStatus.Completed;
    notifyListeners();
  }

  postQuestion(String title, String body) async {
    loadingstatus = QuestionLoadingStatus.Searching;
    notifyListeners();
    await QuestionsWebservice().postQuestion(title, body);
    loadingstatus = QuestionLoadingStatus.Completed;
    notifyListeners();
  }

  editQuestion(int id, String title, String body) async {
    loadingstatus = QuestionLoadingStatus.Searching;
    notifyListeners();
    await QuestionsWebservice().editQuestion(id, title, body);
    loadingstatus = QuestionLoadingStatus.Completed;
    notifyListeners();
  }

  deletQuestion(int id) async {
    loadingstatus = QuestionLoadingStatus.Searching;
    notifyListeners();
    await QuestionsWebservice().deleteQuestion(id);
    loadingstatus = QuestionLoadingStatus.Completed;
    notifyListeners();
  }

  List<QuestionViewModel> get questionsList => _questionsList;
  QuestionViewModel get questionById => _questionById;
}
