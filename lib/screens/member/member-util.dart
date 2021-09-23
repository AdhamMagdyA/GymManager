import 'package:flutter/material.dart';
import 'package:gym_project/screens/Events/events-list.dart';
import 'package:gym_project/screens/Events/events-tile.dart';
import 'package:gym_project/screens/Supplements/supplement-details.dart';
import 'package:gym_project/screens/Supplements/supplement-grid-view.dart';
import 'package:gym_project/screens/admin/branches/edit_branch.dart';
import 'package:gym_project/screens/admin/classes/class_details.dart';
import 'package:gym_project/screens/admin/classes/edit_class.dart';
import 'package:gym_project/screens/admin/memberships/create_membership.dart';
import 'package:gym_project/screens/admin/memberships/edit_membership.dart';
import 'package:gym_project/screens/admin/nutritionist_sessions/edit_nutrionist_session.dart';
import 'package:gym_project/screens/admin/users/user_details.dart';
import 'package:gym_project/screens/admin/users/users_list.dart';
import 'package:gym_project/screens/coach/others-screen.dart';
import 'package:gym_project/screens/common/FormTemplate.dart';
import 'package:gym_project/screens/common/ProfilePage.dart';
import 'package:gym_project/screens/common/grid_view.dart';
import 'package:gym_project/screens/admin/classes/classes_list.dart';
import 'package:gym_project/screens/admin/admin_home_page.dart';
import 'package:gym_project/screens/common/view-group-details-screen.dart';
import 'package:gym_project/screens/member/home-screen.dart';
import 'package:gym_project/screens/member/schedule.dart';
import 'package:gym_project/screens/member/week-groups.dart';
import 'package:gym_project/screens/nutritionist/plan-schedule.dart';
import 'package:gym_project/screens/nutritionist/view-plans-details-screen.dart';
import 'package:gym_project/screens/questions/add-question-screen.dart';
import 'package:gym_project/screens/questions/questions-screen.dart';
import 'package:gym_project/screens/admin/classes/create_class.dart';
import 'package:gym_project/screens/admin/equipment/create_equipment.dart';
import 'package:gym_project/screens/admin/users/edit_user.dart';
import 'package:gym_project/widget/drawer.dart';

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
      'title': 'Ohters',
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
