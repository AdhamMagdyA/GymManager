import 'package:flutter/material.dart';
import 'package:gym_project/screens/common/grid_view.dart';
import 'package:gym_project/screens/admin/admin_home_page.dart';
import 'package:gym_project/widget/drawer.dart';

class AdminUtil extends StatefulWidget {
  const AdminUtil({Key key}) : super(key: key);

  @override
  _AdminUtilState createState() => _AdminUtilState();
}

class _AdminUtilState extends State<AdminUtil> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  final _pages = [
    {
      'page': AdminHomePage(),
      'title': 'Homepage',
    },
    {
      'page': GridViewScreen(),
      'title': 'Equipment',
    },
    {
      'page': Material(),
      'title': 'Homepage',
    },
    {
      'page': Material(),
      'title': 'Homepage',
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
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
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
