import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';

class MemberSchedule extends StatefulWidget {
  final List<String> _titles = [
    'Yoga',
    'Zumba',
    'Abs',
    'Power Lifting Contest'
  ];
  final List<String> _types = [
    'Class',
    'Online Class',
    'Class',
    'Event',
  ];
  final List<String> _spaces = [
    ' ',
    ' ',
    ' ',
    ' ',
  ];
  final List<String> _times = [
    '10:30 AM',
    '12:30 PM',
    '2:30 PM',
    '4:00 PM',
  ];

  @override
  _MemberScheduleState createState() => _MemberScheduleState();
}

class _MemberScheduleState extends State<MemberSchedule> {
  final length = 4;

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/schedule');
          },
          isExtended: false,
          label: Icon(Icons.add),
        ),
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Container(
        color: Colors.black,
        padding: EdgeInsetsDirectional.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFFFCE2B),
                      size: 22.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    //-->header
                    child: new Text('Your Schedule',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'sans-serif-light',
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
            Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: TextEditingController(text: 'Search...'),
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      suffixIcon: Material(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(Icons.search),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                )),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    if (widget._types[index] == 'Class')
                      Navigator.pushNamed(context, '/class-details');
                    else if (widget._types[index] == 'Event')
                      Navigator.pushNamed(context, '/event-details');
                  },
                  child: CustomListTileWithoutCounter(
                      'assets/images/branch.png',
                      widget._titles[index],
                      'Type:' + widget._types[index],
                      widget._spaces[index],
                      widget._times[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
