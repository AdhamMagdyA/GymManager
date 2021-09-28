import 'package:flutter/material.dart';
import 'package:gym_project/screens/common/view-group-details-screen.dart';
import 'package:gym_project/screens/member/training-mode/training_mode_overview_screen.dart';

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
                      CustomListTileWithTitleAndTrailing(
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

class CustomListTileWithTitleAndTrailing extends StatefulWidget {
  final String path;
  final String title;

  CustomListTileWithTitleAndTrailing(
    this.path,
    this.title,
  );

  @override
  _CustomListTileWithTitleAndTrailingState createState() =>
      _CustomListTileWithTitleAndTrailingState();
}

class _CustomListTileWithTitleAndTrailingState
    extends State<CustomListTileWithTitleAndTrailing> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
          minVerticalPadding: 10,
          leading: CircleAvatar(
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
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => GroupDetailsScreen(),
                    ),
                  );
                },
                child: Text(
                  'View Group Details',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          trailing: Container(
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 5),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => TrainingModeOverviewScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Start Training',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                // Expanded(
                //   child: Container(),
                // ),
                SizedBox(height: 5),
              ],
            ),
          )),
    );
  }
}
