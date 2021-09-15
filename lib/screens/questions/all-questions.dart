import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile.dart';

import 'questions-list-tile.dart';

class AllQuestions extends StatelessWidget {
  const AllQuestions({Key key}) : super(key: key);

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
                    "User 1",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse dapibus efficitur purus, sit amet vulputate leo ultricies vitae. Donec gravida ut erat nec pretium. Sed facilisis nunc et enim finibus malesuada. In ultricies rutrum lectus et fringilla. Integer sed dapibus leo, non?",
                    () {},
                    1,
                    "25-9-2021 at 8:00 PM",
                    ""),
                QuestionsListTile(
                    "User 2",
                    "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc, nec euismod tortor lorem ut risus.?",
                    () {},
                    2,
                    "25-9-2021 at 7:00 PM",
                    ""),
                QuestionsListTile(
                    "User 3",
                    "Nulla congue purus nisi, eu gravida lectus vulputate sit amet. Nam sem ante, lobortis scelerisque urna et, tincidunt vehicula eros. Ut convallis auctor quam, ac malesuada elit accumsan in. Nunc vulputate ullamcorper pharetra. Suspendisse scelerisque nulla porta dictum?",
                    () {},
                    4,
                    "25-9-2021 at 5:30 PM",
                    ""),
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
