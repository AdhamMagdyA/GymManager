import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';
import 'package:gym_project/common/only_title_card.dart';

class Others extends StatefulWidget {
  Others();

  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  final length = 5;
  final title = ["Exercises", "classes", "equipment", "sessions", "diet plans"];
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsetsDirectional.all(10),
        child: ListView(
          children: [
            SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: length,
                itemBuilder: (ctx, index) {
                  return OnlyTitleCard(title[index]);
                }),
          ],
        ),
      ),
    );
  }
}
