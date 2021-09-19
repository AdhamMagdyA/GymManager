import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:gym_project/screens/questions/single-question.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

import 'questions-list-tile.dart';

class AllQuestions extends StatefulWidget {
  const AllQuestions({Key key}) : super(key: key);

  @override
  _AllQuestionsState createState() => _AllQuestionsState();
}

class _AllQuestionsState extends State<AllQuestions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                QuestionsListTile(
                  title: "User 1",
                  body:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse dapibus efficitur purus, sit amet vulputate leo ultricies vitae. Donec gravida ut erat nec pretium. Sed facilisis nunc et enim finibus malesuada. In ultricies rutrum lectus et fringilla. Integer sed dapibus leo, non?",
                  date: "25-9-2021 at 8:00 PM",
                  id: 1,
                  num_of_answers: 2,
                  //role: Provider.of<User>(context, listen: false).role,
                ),
                QuestionsListTile(
                  title: "User 2",
                  body:
                      "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc, nec euismod tortor lorem ut risus.?",
                  num_of_answers: 2,
                  date: "25-9-2021 at 7:00 PM",
                  id: 2,
                  //role: Provider.of<User>(context, listen: false).role,
                ),
                QuestionsListTile(
                  title: "User 3",
                  body:
                      "Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum?",
                  num_of_answers: 4,
                  id: 3,
                  date: "25-9-2021 at 5:30 PM",
                  //role: Provider.of<User>(context, listen: false).role
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
