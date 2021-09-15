import 'package:flutter/material.dart';
import 'package:gym_project/screens/admin/view-private-session-requests.dart';
import 'package:gym_project/screens/coach/classes-screen.dart';
import 'package:gym_project/screens/coach/coach-home-screen.dart';
import 'package:gym_project/screens/coach/exercises/create-exercise.dart';
import 'package:gym_project/screens/coach/others-screen.dart';
import 'package:gym_project/screens/coach/members-screen.dart';
import 'package:gym_project/screens/coach/private%20sessions/create-private-session.dart';
import 'package:gym_project/screens/coach/sessions-screen.dart';
import 'package:gym_project/screens/coach/sets/create-set.dart';
import 'package:gym_project/screens/coach/view-booked-sessions.dart';
import 'package:gym_project/screens/coach/view-my-private-sessions.dart';
import 'package:gym_project/screens/common/Form-Template.dart';
import 'package:gym_project/screens/common/details-screen.dart';
import 'package:gym_project/screens/common/grid_view.dart';
import 'package:gym_project/screens/common/view-exercises-details-screen.dart';
import 'package:gym_project/screens/common/view-group-details-screen.dart';
import 'package:gym_project/screens/common/view-private-session-details.dart';
import 'package:gym_project/screens/common/view-set-details-screen.dart';
import 'package:gym_project/screens/member/view-private-sessions.dart';
import 'package:gym_project/screens/coach/view-groups.dart';
import 'package:gym_project/screens/coach/view-sets.dart';
import 'package:gym_project/widget/coach-drawer.dart';

import 'groups/create-group.dart';

class CoachTabsScreen extends StatefulWidget {
  const CoachTabsScreen({Key key}) : super(key: key);

  @override
  _CoachTabsScreenState createState() => _CoachTabsScreenState();
}

class _CoachTabsScreenState extends State<CoachTabsScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 3; // 2 => home page
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _pages = [
      {
        'page': ClassesScreen(),
        'title': 'My Classes',
      },
      {
        'page': SessionsScreen(_tabController),
        'title': 'My Sessions',
      },
      {
        'page': CoachHomeScreen(),
        'title': 'Home',
      },
      {
        'page': CreatePrivateSessionForm(),
        'title': 'My members',
      },
      {
        'page': GridViewScreen(),
        'title': 'Others',
      },
    ];
    super.initState();
  }

  var _pages = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedIndex]['title'],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        bottom: _selectedIndex == 1
            ? TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "Session Types",
                  ),
                  Tab(
                    text: "Booked Sessions",
                  ),
                ],
              )
            : null,
      ),
      drawer: CoachDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF040404),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'My Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'My Sessions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Others',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      ////navigation bar code begins here
      //     bottomNavigationBar: MotionTabBar(
      //         labels: [
      //           "classes", "sessions","Home","member","invent"
      //         ],
      //         initialSelectedTab: "Home",
      //         tabIconColor: Colors.black,
      //         tabSelectedColor: Color(0xFFFFCE2B),
      //         onTabItemSelected: (int value){
      //              setState(() {
      //                 _tabController.index = value;
      //              });
      //         },
      //         icons: [
      //           Icons.account_box,Icons.menu,Icons.home,Icons.menu,Icons.question_answer
      //         ],
      //         textStyle: TextStyle(color: Colors.black),
      // ),
      /////////////////////////////////////////////////////////
    );
  }
}
