import 'package:flutter/material.dart';
import 'package:gym_project/screens/answers/answers-list-tile.dart';
import 'package:gym_project/screens/questions/questions-list-tile.dart';
import 'package:gym_project/viewmodels/answer-list-view-model.dart';
import 'package:gym_project/viewmodels/question-list-view-model.dart';
import 'package:gym_project/widget/button.dart';
import 'package:provider/provider.dart';

class SingleQuestionScreen extends StatefulWidget {
  //const SingleQuestionScreen({Key key}) : super(key: key);
  final int question_id;
  final String role;

  SingleQuestionScreen({this.question_id, this.role});

  @override
  _SingleQuestionScreenState createState() => _SingleQuestionScreenState();
}

class _SingleQuestionScreenState extends State<SingleQuestionScreen> {
  final TextEditingController _textController = TextEditingController();
  Color iconColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iconColor = Colors.grey;
    //Provider.of<AnswerListViewModel>(context, listen: false).getAnswers(widget.question_id);
  }

  @override
  Widget build(BuildContext context) {
    var question = Provider.of<QuestionListViewModel>(context);
    var answers = Provider.of<AnswerListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Answers',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff181818),
        iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: widget.question_id != null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QuestionsListTile(
                      id: question.questionById.id,
                      user_name: 'User',
                      body: question.questionById.body,
                      date: question.questionById.date,
                      title: question.questionById.title,
                      num_of_answers: 3,
                      role: widget.role,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(children: [
                            AnswersListTile(
                              username: 'User',
                              body: answers.answersList[index].body,
                              date: answers.answersList[index].date,
                              role: widget.role,
                              id: answers.answersList[index].id,
                              question_id:
                                  answers.answersList[index].question_id,
                            ),
                            index < answers.answersList.length - 1
                                ? Divider(
                                    color: Colors.grey,
                                    thickness: 0.5,
                                  )
                                : Container(),
                          ]);
                        },
                        itemCount: answers.answersList.length,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              fontSize: 15,
                            ),
                            controller: _textController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xFFFFCE2B),
                                ),
                              ),
                              hintText: 'Write an answer...',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                                fontSize: 15,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xFFFFCE2B),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: iconColor,
                                ),
                                onPressed: _textController.text.isEmpty
                                    ? null
                                    : () async {
                                        await Provider.of<AnswerListViewModel>(
                                                context,
                                                listen: false)
                                            .postAnswer(widget.question_id,
                                                _textController.text);
                                        await Provider.of<AnswerListViewModel>(
                                                context,
                                                listen: false)
                                            .getAnswers(widget.question_id);
                                        setState(() {
                                          _textController.text = "";
                                          iconColor = Colors.grey;
                                        });
                                      },
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              if (_textController.text.isEmpty) {
                                setState(() {
                                  iconColor = Colors.grey;
                                });
                              } else {
                                setState(() {
                                  iconColor = Color(0xFFFFCE2B);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Color(0xFFFFCE2B),
                  ),
                ),
        ),
      ),
    );
  }
}
