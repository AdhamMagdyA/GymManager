import 'package:flutter/material.dart';
import 'package:gym_project/screens/questions/questions-list-tile.dart';

class MyQuestions extends StatelessWidget {
  const MyQuestions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          QuestionsListTile(
            title: "Me",
            body:
                "Sed non elementum ante, sit amet pulvinar mauris. Quisque posuere congue odio, sed malesuada nisi interdum nec. Donec hendrerit est vel lacinia egestas. Nullam quis scelerisque sem, ut tincidunt neque. Fusce risus dolor, egestas id tristique ut, consectetur vel eros. Etiam in?",
            id: 1,
            num_of_answers: 3,
            date: "25-9-2021",
            //role: "question_owner"
          ),
          QuestionsListTile(
            title: "Me",
            body:
                "ligula diam. Nunc hendrerit vestibulum ipsum, id volutpat massa. Maecenas eget mi leo. Maecenas eget sapien enim. Maecenas rhoncus risus vitae facilisis dictum. Maecenas ornare nec nisi condimentum euismod. Curabitur sollicitudin urna purus, id rutrum ligula sollicitudin?",
            num_of_answers: 5,
            date: "25-9-2021",
            id: 2,
            //role: "question_owner"
          ),
          QuestionsListTile(
            title: "Me",
            body:
                "Aenean pellentesque nibh in nisl pulvinar luctus eu vel nunc. Nullam efficitur urna odio, vel luctus enim pharetra vel. Nam at mattis justo. Duis quis sagittis nisi. Maecenas ultricies lacinia mauris sit amet fermentum. Maecenas tempus consectetur augue venenatis eleifend?",
            num_of_answers: 8,
            date: "25-9-2021",
            id: 3,
            //role: "question_owner"
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
