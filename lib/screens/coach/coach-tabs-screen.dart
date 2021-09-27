import 'package:flutter/material.dart';
import 'package:gym_project/screens/admin/classes/classes_list.dart';
import 'package:gym_project/screens/admin/classes/edit_class.dart';
import 'package:gym_project/screens/admin/users/users_list.dart';
import 'package:gym_project/screens/coach/home-screen.dart';
import 'package:gym_project/screens/coach/others-screen.dart';

import 'package:gym_project/screens/coach/private%20sessions/create-private-session.dart';
import 'package:gym_project/screens/coach/private%20sessions/sessions-screen.dart';
import 'package:gym_project/screens/coach/sets/create-set.dart';
import 'package:gym_project/screens/coach/sets/view-sets.dart';
import 'package:gym_project/screens/member/training-mode/training_mode_overview_screen.dart';
import 'package:gym_project/widget/coach-drawer.dart';

class CoachTabsScreen extends StatefulWidget {
  const CoachTabsScreen({Key key}) : super(key: key);

  @override
  _CoachTabsScreenState createState() => _CoachTabsScreenState();
}

class _CoachTabsScreenState extends State<CoachTabsScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0; // 0 => home page
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _pages = [
      {
        'page': CreateSetForm(),
        'title': 'Home',
      },
      {
        'page': ClassesList(),
        'title': 'My Classes',
      },
      {
        'page': SessionsScreen(_tabController),
        'title': 'My Sessions',
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
        backgroundColor: Color(0xff181818),
        iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
        bottom: _selectedIndex == 2
            ? TabBar(
                labelColor: Theme.of(context).primaryColor,
                indicatorColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.white,
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
        backgroundColor: Color(0xff181818),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Classes',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'My Sessions',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'My members',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Others',
            backgroundColor: Colors.black,
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
