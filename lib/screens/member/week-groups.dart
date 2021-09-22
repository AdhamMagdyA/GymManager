import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';
import 'package:gym_project/widget/drawer.dart';

class WeekGroups extends StatelessWidget {
  WeekGroups({Key key}) : super(key: key);

  final List groups = [
    {
      'day': '18-09-2021',
      'title': 'Chest Group',
    },
    {
      'day': '19-09-2021',
      'title': 'Legs Group',
    },
    {
      'day': '20-09-2021',
      'title': 'Back Group',
    },
    {
      'day': '21-09-2021',
      'title': 'Arms Group',
    },
    {
      'day': '22-09-2021',
      'title': 'Full Body',
    },
    {
      'day': '23-09-2021',
      'title': 'Cardio',
    },
    {
      'day': '24-09-2021',
      'title': 'Group 7',
    },
  ];

  final List weekDays = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Week Groups',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff181818),
        iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text(
                'This Week Groups',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: groups.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weekDays[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      CustomListTileWithTitleOnly(
                        'assets/images/branch.png',
                        groups[index]['title'],
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class CustomListTileWithTitleOnly extends StatefulWidget {
  final String path;
  final String title;

  CustomListTileWithTitleOnly(
    this.path,
    this.title,
  );

  @override
  _CustomListTileWithTitleOnlyState createState() =>
      _CustomListTileWithTitleOnlyState();
}

class _CustomListTileWithTitleOnlyState
    extends State<CustomListTileWithTitleOnly> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        tileColor: Color(0xff181818),
        minVerticalPadding: 10,
        leading: CircleAvatar(
          backgroundColor: Color(0xff181818),
          radius: 20,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                widget.path,
                fit: BoxFit.cover,
              )),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
