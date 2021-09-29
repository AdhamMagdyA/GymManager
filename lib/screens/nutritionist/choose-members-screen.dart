import 'package:flutter/material.dart';
import 'package:gym_project/screens/nutritionist/plan-edit-form.dart';
import 'package:gym_project/screens/nutritionist/view-plans-details-screen.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class ChooseMembersScreen extends StatefulWidget {
  bool isSelectionTime = false;

  ChooseMembersScreen(this.isSelectionTime);
  @override
  _ChooseMembersScreenState createState() => _ChooseMembersScreenState();

  static int whoIsSelected = -1;

  final List<dynamic> members = [
    {
      'id': 1,
      'title': 'Member 1',
      'subtitle1': 'Branch',
      'subtitle2': '01002003004',
      'subtitle3': 'Member',
    },
    {
      'id': 2,
      'title': 'Member 2',
      'subtitle1': 'Branch',
      'subtitle2': '01002003004',
      'subtitle3': 'Member',
    },
    {
      'id': 3,
      'title': 'Member 3',
      'subtitle1': 'Branch',
      'subtitle2': '01002003004',
      'subtitle3': 'Member',
    },
    {
      'id': 4,
      'title': 'Member 4',
      'subtitle1': 'Branch',
      'subtitle2': '01002003004',
      'subtitle3': 'Member',
    },
    {
      'id': 5,
      'title': 'Member 5',
      'subtitle1': 'Branch',
      'subtitle2': '01002003004',
      'subtitle3': 'Member',
    },
    {
      'id': 6,
      'title': 'Member 6',
      'subtitle1': 'Branch',
      'subtitle2': '01002003004',
      'subtitle3': 'Member',
    },
    {
      'id': 7,
      'title': 'Member 7',
      'subtitle1': 'Branch',
      'subtitle2': '01002003004',
      'subtitle3': 'Member',
    }
  ];
}

class _ChooseMembersScreenState extends State<ChooseMembersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: EdgeInsetsDirectional.all(10),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                child: ListView(
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.members.length,
                        itemBuilder: (ctx, index) {
                          return myListTile(
                              widget.members[index]['title'],
                              widget.members[index]['subtitle1'],
                              widget.members[index]['subtitle2'],
                              index,
                              widget.isSelectionTime);
                        }),
                  ],
                ),
              ),
              if (ChooseMembersScreen.whoIsSelected != -1)
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFFCE2B)),
                          child: Text('Submit'),
                          onPressed: () {
                            Navigator.pop(
                                context,
                                widget.members[
                                    ChooseMembersScreen.whoIsSelected]);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFFCE2B), elevation: 10),
                          child: Text('Cancel'),
                          onPressed: () {
                            setState(() {
                              ChooseMembersScreen.whoIsSelected = -1;
                            });
                          },
                        ),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myListTile(String title, String description, String duration,
      int index, bool selectionTime) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: ChooseMembersScreen.whoIsSelected == index
            ? Colors.white24
            : Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: () {
          if (!selectionTime) {
            Navigator.pushNamed(context, '/user-details');
          } else {
            setState(() {
              ChooseMembersScreen.whoIsSelected = index;
            });
          }
        },
        selected: ChooseMembersScreen.whoIsSelected == index,
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: Icon(Icons.note),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description,
              style: TextStyle(color: Colors.white24),
            ),
            Text(
              duration,
              style: TextStyle(color: Colors.white24),
            ),
            if (selectionTime)
              TextButton(
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlansDetailsScreen(),
                      ));
                },
              ),
          ],
        ),
      ),
    );
  }
}
