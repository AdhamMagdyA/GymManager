import 'package:flutter/material.dart';
import 'package:gym_project/screens/coach/classes-screen.dart';
import 'package:gym_project/screens/coach/coach-home-screen.dart';
import 'package:gym_project/screens/coach/others-screen.dart';
import 'package:gym_project/screens/coach/members-screen.dart';
import 'package:gym_project/screens/coach/sessions-screen.dart';
import 'package:gym_project/widget/coach-drawer.dart';

class CoachTabsScreen extends StatefulWidget {
  const CoachTabsScreen({Key key}) : super(key: key);

  @override
  _CoachTabsScreenState createState() => _CoachTabsScreenState();
}

class _CoachTabsScreenState extends State<CoachTabsScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 2; // 2 => home page

  final _pages = [
    {
      'page': ClassesScreen(),
      'title': 'My Classes',
    },
    {
      'page': SessionsScreen(),
      'title': 'My Sessions',
    },
    {
      'page': CoachHomeScreen(),
      'title': 'Home',
    },
    {
      'page': MembersScreen(),
      'title': 'My members',
    },
    {
      'page': OthersScreen(),
      'title': 'Others',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: CoachDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFCE2B),
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
        selectedItemColor: Colors.black,
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
