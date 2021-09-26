import 'package:flutter/material.dart';

import 'package:gym_project/screens/member/home-screen.dart';
import 'package:gym_project/screens/member/schedule.dart';
import 'package:gym_project/screens/member/week-groups.dart';
import 'package:gym_project/screens/nutritionist/plan-schedule.dart';

import 'member-drawer.dart';
import 'member-others.dart';

class MemberUtil extends StatefulWidget {
  const MemberUtil({Key key}) : super(key: key);

  @override
  _MemberUtilState createState() => _MemberUtilState();
}

class _MemberUtilState extends State<MemberUtil> with TickerProviderStateMixin {
  //MotionTabController _tabController;
  int _selectedIndex = 0;

  final _pages = [
    {
      'page': MemberHomeScreen(),
      'title': 'Homepage',
    },
    {
      'page': MemberSchedule(),
      'title': 'Schedule',
    },
    {
      'page': WeekGroups(),
      'title': 'Training Plan',
    },
    {
      'page': PlanSchedule(),
      'title': 'Diet Plan',
    },
    {
      'page': MemberOthers(),
      'title': 'Others',
    },
  ];
  @override
  void initState() {
    super.initState();
  }

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
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff181818),
        iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
      ),
      drawer: MemberDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff181818),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Diet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Others',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFFCE2B),
        unselectedItemColor: Color(0xFFFFCE2B).withAlpha(100),
        onTap: _onItemTapped,
      ),
    );
  }
}
