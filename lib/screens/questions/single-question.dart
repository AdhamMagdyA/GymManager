import 'package:flutter/material.dart';
import 'package:gym_project/screens/answers/answers-list-tile.dart';
import 'package:gym_project/screens/questions/questions-list-tile.dart';
import 'package:gym_project/widget/button.dart';

class SingleQuestionScreen extends StatefulWidget {
  //const SingleQuestionScreen({Key key}) : super(key: key);
  int question_id;

  SingleQuestionScreen({this.question_id});

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QuestionsListTile(
                title: "Youssef Mostafa",
                body:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse dapibus efficitur purus, sit amet vulputate leo ultricies vitae. Donec gravida ut erat nec pretium. Sed facilisis nunc et enim finibus malesuada. In ultricies rutrum lectus et fringilla. Integer sed dapibus leo, non?",
                num_of_answers: 5,
                date: "12-9-2021 at 10:00 PM",
                id: 5,
                role: ""),
            Expanded(
              child: ListView(
                children: [
                  AnswersListTile(
                      "User 1",
                      "Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
                      "Today at 1:30 PM"),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.1,
                  ),
                  AnswersListTile(
                      "User 2",
                      "Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
                      "Today at 2:15 AM"),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  AnswersListTile(
                      "User 3",
                      "Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
                      "Yesterday at 7:30 PM"),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  AnswersListTile(
                      "User 4",
                      "Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
                      "13-9-2021 at 12:30 PM"),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  AnswersListTile(
                      "User 5",
                      "Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
                      "13-9-2021 at 1:30 AM"),
                ],
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
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      hintText: 'Write an answer...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        fontSize: 15,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.yellow),
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
                        onPressed: _textController.text.isEmpty ? null : () {},
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
                          iconColor = Colors.amber;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
