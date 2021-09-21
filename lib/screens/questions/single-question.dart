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

  List<Widget> answers = [
    AnswersListTile(
      title: "User 1",
      body:
          "1Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
      date: "Today at 1:30 PM",
      //role: "admin",
    ),
    Divider(
      color: Colors.grey,
      thickness: 0.1,
    ),
    AnswersListTile(
      title: "User 2",
      body:
          "2Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
      date: "Today at 2:15 AM",
      //role: "admin",
    ),
    Divider(
      color: Colors.grey,
      thickness: 1,
    ),
    AnswersListTile(
        title: "User 3",
        body:
            "3Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
        date: "Yesterday at 7:30 PM"),
    Divider(
      color: Colors.grey,
      thickness: 1,
    ),
    AnswersListTile(
        title: "User 4",
        body:
            "4Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
        date: "13-9-2021 at 12:30 PM"),
    Divider(
      color: Colors.grey,
      thickness: 0.5,
    ),
    AnswersListTile(
        title: "User 5",
        body:
            "5Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum",
        date: "13-9-2021 at 1:30 AM"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iconColor = Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
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
                //role: ""
              ),
              Expanded(
                child:
                    /*ListView(
                  children: answers,
                ),*/
                    ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return answers[index];
                  },
                  itemCount: answers.length,
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
                              : () {
                                  setState(() {
                                    answers.insert(
                                        0,
                                        AnswersListTile(
                                          body: _textController.text,
                                          date: DateTime.now().toString(),
                                          title: "Me",
                                        ));

                                    answers.insert(
                                        1,
                                        Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ));

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
          ),
        ),
      ),
    );
  }
}
