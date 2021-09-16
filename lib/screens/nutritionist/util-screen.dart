import 'package:flutter/material.dart';
import 'package:gym_project/screens/common/grid_view.dart';
import 'package:gym_project/screens/admin/admin_home_page.dart';
import 'package:gym_project/screens/nutritionist/fitness-summaries.dart';
import 'package:gym_project/screens/nutritionist/meals-screen.dart';
import 'package:gym_project/screens/nutritionist/nutritionist-home-screen.dart';
import 'package:gym_project/screens/nutritionist/plans-screen.dart';
import 'package:gym_project/widget/drawer.dart';
import 'package:motion_tab_bar/MotionTabController.dart';

import 'others-screen.dart';

class NutritionistUtil extends StatefulWidget {
  const NutritionistUtil({Key key}) : super(key: key);

  @override
  _NutritionistUtilState createState() => _NutritionistUtilState();
}

class _NutritionistUtilState extends State<NutritionistUtil>
    with TickerProviderStateMixin {
  MotionTabController _tabController;
  int _selectedIndex = 0;

  final _pages = [
    {
      'page': NutritionistHomeScreen(),
      'title': 'Homepage',
    },
    {
      'page': PlansViewScreen(),
      'title': 'Plans',
    },
    {
      'page': FitnessSummariesScreen(),
      'title': 'Fitness Summaries',
    },
    {
      'page': MealsViewScreen(),
      'title': 'Meals',
    },
    {
      'page': OthersScreen(),
      'title': 'Others',
    }
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
            icon: Icon(Icons.timeline),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Fitness Summaries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Meals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Others',
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
      //           "classes", "sessions","NutritionistUtil","member","invent"
      //         ],
      //         initialSelectedTab: "NutritionistUtil",
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
