import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:gym_project/screens/questions/single-question.dart';
import 'package:gym_project/viewmodels/answer-list-view-model.dart';
import 'package:gym_project/viewmodels/login-view-model.dart';
import 'package:gym_project/viewmodels/question-list-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

import 'questions-list-tile.dart';

class AllQuestions extends StatefulWidget {
  const AllQuestions({Key key}) : super(key: key);

  @override
  _AllQuestionsState createState() => _AllQuestionsState();
}

class _AllQuestionsState extends State<AllQuestions> {
  String user_role;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<QuestionListViewModel>(context, listen: false).getQuestions();
    user_role = Provider.of<LoginViewModel>(context, listen: false).role;
  }

  @override
  Widget build(BuildContext context) {
    var questions = Provider.of<QuestionListViewModel>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: questions.loadingstatus == QuestionLoadingStatus.Completed
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return true
                          ? QuestionsListTile(
                              role: user_role,
                              user_name: 'User',
                              id: questions.questionsList[index].id,
                              body: questions.questionsList[index].body,
                              date: questions.questionsList[index].date,
                              num_of_answers: 3,
                              title: questions.questionsList[index].title,
                            )
                          : Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Color(0xFFFFCE2B),
                                ),
                              ),
                            );
                    },
                    itemCount: questions.questionsList.length,
                    padding: const EdgeInsets.all(10),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Color(0xFFFFCE2B),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
