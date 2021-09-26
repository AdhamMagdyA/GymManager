import 'package:flutter/material.dart';
import 'package:gym_project/screens/questions/questions-list-tile.dart';
import 'package:gym_project/viewmodels/login-view-model.dart';
import 'package:gym_project/viewmodels/question-list-view-model.dart';
import 'package:provider/provider.dart';

class MyQuestions extends StatefulWidget {
  const MyQuestions({Key key}) : super(key: key);

  @override
  _MyQuestionsState createState() => _MyQuestionsState();
}

class _MyQuestionsState extends State<MyQuestions> {
  String user_role;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<QuestionListViewModel>(context, listen: false).getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    var questions = Provider.of<QuestionListViewModel>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: questions.loadingstatus == QuestionLoadingStatus.Completed
          ? ListView.builder(
              itemBuilder: (context, index) {
                return questions.questionsList[index].user_id == 22
                    ? QuestionsListTile(
                        role: 'question_owner',
                        user_name: 'User',
                        id: questions.questionsList[index].id,
                        body: questions.questionsList[index].body,
                        date: questions.questionsList[index].date,
                        num_of_answers: 3,
                        title: questions.questionsList[index].title,
                      )
                    : Container();
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
    );
  }
}
