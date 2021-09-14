import 'package:flutter/material.dart';
import 'package:gym_project/screens/Events/events-list.dart';
import 'package:gym_project/screens/Events/events-tile.dart';
import 'package:gym_project/screens/Supplements/supplement-details.dart';
import 'package:gym_project/screens/Supplements/supplement-grid-view.dart';
import 'package:gym_project/screens/common/grid_view.dart';
import 'package:gym_project/screens/admin/admin_home_page.dart';
import 'package:gym_project/widget/drawer.dart';
//import 'package:motion_tab_bar/MotionTabController.dart';

import 'branches/branches_list.dart';
import 'equipment/equipment_list.dart';

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
      'page': AdminHomePage(),
      'title': 'Homepage',
    },
    {
      'page': EquipmentList(),
      'title': 'Equipment',
    },
    {
      'page': BranchesList(),
      'title': 'Branches',
    },
    {
      'page': EventListView(),
      'title': 'Events',
    },
    {
      'page': SupplementList(),
      'title': 'Supplements',
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
      drawer: MyDrawer(),
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
            icon: Icon(Icons.two_wheeler_rounded),
            label: 'Equipment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspaces),
            label: 'Branches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Supplements',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFFCE2B),
        unselectedItemColor: Color(0xFFFFCE2B).withAlpha(100),
        onTap: _onItemTapped,
      ),
      ////navigation bar code begins here
      //     bottomNavigationBar: MotionTabBar(
      //         labels: [
      //           "classes", "sessions","AdminUtil","member","invent"
      //         ],
      //         initialSelectedTab: "AdminUtil",
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
