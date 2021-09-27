import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:gym_project/screens/admin/admin_home_page.dart';
import 'package:gym_project/screens/admin/branches/branches_list.dart';
import 'package:gym_project/screens/admin/others.dart';
import 'package:gym_project/screens/admin/users/users_list.dart';
import 'package:gym_project/screens/announcements/announcements-screen.dart';
import 'package:gym_project/screens/questions/add-question-screen.dart';
import 'package:gym_project/screens/questions/all-questions.dart';
import 'package:gym_project/screens/questions/coach-questions.dart';
import 'package:gym_project/screens/questions/my-questions.dart';
import 'package:gym_project/screens/questions/nutritionist-questions.dart';
import 'package:gym_project/viewmodels/answer-list-view-model.dart';
import 'package:gym_project/viewmodels/question-list-view-model.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen>
    with SingleTickerProviderStateMixin {
  Widget page;
  int _selectedIndex = 4;

  List<Widget> tabs = [
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'My Questions',
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    page = SafeArea(
      child: TabBarView(
        children: [
          AllQuestions(),
          MyQuestions(),
        ],
      ),
    );
    Provider.of<QuestionListViewModel>(context, listen: false).getQuestions();
    Provider.of<AnswerListViewModel>(context, listen: false).getAllAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        floatingActionButton: Container(
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.1,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddQuestionScreen(
                    post_type: 'Add',
                  ),
                ),
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.16),
          child: Column(
            children: [
              AppBar(
                title: Text(
                  'Questions',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Color(0xff181818),
                iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                color: Colors.black,
                child: new SafeArea(
                  child: new TabBar(
                    unselectedLabelColor: Colors.amber,
                    tabs: tabs,
                    indicator: BubbleTabIndicator(
                      indicatorRadius: 20,
                      indicatorColor: Color(0xFFFFCE2B),
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      indicatorHeight: 15,
                      padding: EdgeInsets.all(20),
                      insets: EdgeInsets.all(22),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              AllQuestions(),
              MyQuestions(),
            ],
          ),
        ),
      ),
    );
  }
}
