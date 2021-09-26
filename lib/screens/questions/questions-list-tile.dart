import 'package:flutter/material.dart';
import 'package:gym_project/screens/questions/add-question-screen.dart';
import 'package:gym_project/screens/questions/single-question.dart';
import 'package:gym_project/viewmodels/login-view-model.dart';
import 'package:gym_project/viewmodels/question-list-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class QuestionsListTile extends StatefulWidget {
  final String user_name;
  final String title;
  final String body;
  final String date;
  final int num_of_answers;
  final String role;
  final int id;

  QuestionsListTile({
    this.user_name,
    this.title,
    this.body,
    this.date,
    this.num_of_answers,
    this.role,
    this.id,
  });
  @override
  _QuestionsListTileState createState() => _QuestionsListTileState();
}

class _QuestionsListTileState extends State<QuestionsListTile> {
  bool is_visible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    is_visible = true;
    //widget.role = Provider.of<LoginViewModel>(context, listen: false).role;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: is_visible,
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 10),
        decoration: BoxDecoration(
          color: Color(0xff181818),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          isThreeLine: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleQuestionScreen(
                  question_id: widget.id,
                ),
              ),
            );
          },
          minVerticalPadding: 10,
          title: Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.account_circle),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user_name,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'assets/fonts/Changa-Bold.ttf',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.date,
                          style: TextStyle(
                            color: Color(0xFFFFCE2B),
                            fontSize: 12,
                            fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                (widget.role == "question_owner" || widget.role == "admin")
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Color(0xFF181818),
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(0xFF181818)),
                                  ),
                                  content: Text(
                                    "Would you like to delete this question ?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          'assets/fonts/Changa-Bold.ttf',
                                      fontSize: 15,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MaterialButton(
                                          onPressed: () async {
                                            await Provider.of<
                                                        QuestionListViewModel>(
                                                    context,
                                                    listen: false)
                                                .deletQuestion(widget.id);
                                            setState(() {
                                              is_visible = false;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("YES"),
                                          color: Color(0xFFFFCE2B),
                                          shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                              color: Color(0xFFFFCE2B),
                                            ),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("NO"),
                                          color: Color(0xFFFFCE2B),
                                          shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                              color: Color(0xFFFFCE2B),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddQuestionScreen(
                                    body: widget.body,
                                    title: widget.title,
                                    id: widget.id,
                                    post_type: 'Edit',
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.body,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'assets/fonts/Changa-Bold.ttf',
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4, right: 8),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleQuestionScreen(
                              question_id: widget.id,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        widget.num_of_answers.toString() + " Answers",
                        style: TextStyle(
                          color: Color(0xFFFFCE2B),
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
