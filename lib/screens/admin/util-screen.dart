import 'package:flutter/material.dart';
import 'package:gym_project/screens/admin/branches/edit_branch.dart';
import 'package:gym_project/screens/admin/classes/class_details.dart';
import 'package:gym_project/screens/admin/users/user_details.dart';
import 'package:gym_project/screens/common/FormTemplate.dart';
import 'package:gym_project/screens/common/ProfilePage.dart';
import 'package:gym_project/screens/common/grid_view.dart';
import 'package:gym_project/screens/admin/classes/classes_list.dart';
import 'package:gym_project/screens/admin/admin_home_page.dart';
import 'package:gym_project/screens/admin/classes/create_class.dart';
import 'package:gym_project/screens/admin/equipment/create_equipment.dart';
import 'package:gym_project/screens/admin/users/edit_user.dart';
import 'package:gym_project/widget/drawer.dart';
import 'branches/branch_details.dart';
import 'branches/branches_list.dart';
import 'equipment/equipment_details.dart';
import 'equipment/equipment_list.dart';
import 'memberships/membership_details.dart';
import 'memberships/memberships_list.dart';
import 'nutritionist_sessions/nutritionist_sessions_list.dart';
import 'others.dart';

class AdminUtil extends StatefulWidget {
  const AdminUtil({Key key}) : super(key: key);

  @override
  _AdminUtilState createState() => _AdminUtilState();
}

class _AdminUtilState extends State<AdminUtil> with TickerProviderStateMixin {
  //MotionTabController _tabController;
  int _selectedIndex = 0;

  final _pages = [
    {
      'page': MembershipsList(),
      'title': 'Homepage',
    },
    {
      'page': MembershipDetails(),
      'title': 'Equipment',
    },
    {
      'page': BranchesList(),
      'title': 'Branches',
    },
    {
      'page': BranchDetails(),
      'title': 'Branch',
    },
    {
      'page': Others(),
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
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
      ),
      drawer: MyDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_wheeler_rounded),
            label: 'Equipment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspaces),
            label: 'Branches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Branch',
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
