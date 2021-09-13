import 'package:flutter/material.dart';
import 'package:gym_project/screens/common/details-screen.dart';
import 'package:gym_project/screens/common/login-screen.dart';
import 'package:gym_project/screens/member/home-screen.dart';
import 'package:gym_project/widget/drawer.dart';
import 'package:gym_project/widget/member_drawer.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

import 'ProfilePage.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  MotionTabController _tabController;
  int _selectedIndex = 0;

  final _pages = [
    {
      'page': DetailsScreen(),
      'title': 'Home',
    },
    {
      'page': Material(),
      'title': 'Excersices',
    },
    {
      'page': Material(),
      'title': 'Announcements',
    },
    {
      'page': Material(),
      'title': 'Supplements',
    },
    {
      'page': Material(),
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: MemberDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF040404),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Excersices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Supplements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
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
