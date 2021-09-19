import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:gym_project/screens/questions/add-question-screen.dart';
import 'package:gym_project/screens/questions/all-questions.dart';
import 'package:gym_project/screens/questions/coach-questions.dart';
import 'package:gym_project/screens/questions/my-questions.dart';
import 'package:gym_project/screens/questions/nutritionist-questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> tabs = [
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'My Questions',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddQuestionScreen(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF181818),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Container(
            padding: EdgeInsets.only(top: 10),
            color: //Color(0xFF040404),
                Colors.black,
            child: new SafeArea(
              child: new TabBar(
                unselectedLabelColor: Colors.amber,
                tabs: tabs,
                indicator: BubbleTabIndicator(
                  indicatorRadius: 20,
                  indicatorColor: Colors.amber,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  indicatorHeight: 20,
                  padding: EdgeInsets.all(20),
                  insets: EdgeInsets.all(22),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AllQuestions(),
            MyQuestions(),
          ],
        ),
      ),
    );
  }
}