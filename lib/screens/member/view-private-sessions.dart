import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/common/my_choosing_screen.dart';
import 'package:gym_project/common/my_list_tile.dart';

import 'package:flutter/material.dart';

class ViewPrivateSessionsScreen extends StatefulWidget {
  @override
  _ViewPrivateSessionsScreenState createState() =>
      _ViewPrivateSessionsScreenState();
}

class _ViewPrivateSessionsScreenState extends State<ViewPrivateSessionsScreen> {
  static int whoIsSelected = -1;

  final List<dynamic> privateSessions = [
    {
      'title': 'Private Session 1',
      "description": 'Good Private Session',
      'duration': '10:45:22',
      'datetime': '2021-09-13 14:13:51',
      'price': '15.99',
      'coach': {
        'user': {'name': 'Coach name!'}
      },
    },
    {
      'title': 'Private Session 2',
      "description": 'Good Private Session',
      'duration': '06:45',
      'datetime': '2021-09-13 14:13:51',
      'price': '15.99',
      'coach': {
        'user': {'name': 'Coach name!'}
      },
    },
    {
      'title': 'Private Session 3',
      "description": 'Good Private Session',
      'duration': '05:45',
      'datetime': '2021-09-13 14:13:51',
      'price': '15.88',
      'coach': {
        'user': {'name': 'Coach name!'}
      },
    },
    {
      'title': 'Private Session 4',
      "description": 'Good Private Session',
      'duration': '02:34',
      'datetime': '2021-09-13 14:13:51',
      'price': '12.99',
      'coach': {
        'user': {'name': 'Coach name!'}
      },
    },
    {
      'title': 'Private Session 5',
      "description": 'Good Private Session',
      'duration': '02:34',
      'datetime': '2021-09-13 14:13:51',
      'price': '10.99',
      'coach': {
        'user': {'name': 'Coach name!'}
      },
    },
    {
      'title': 'Private Session 5',
      "description": 'Good Private Session',
      'duration': '02:34',
      'datetime': '2021-09-13 14:13:51',
      'price': '10.99',
      'coach': {
        'user': {'name': 'Coach name!'}
      },
    },
    {
      'title': 'Private Session 5',
      "description": 'Good Private Session',
      'duration': '02:34',
      'datetime': '2021-09-13 14:13:51',
      'price': '10.99',
      'coach': {
        'user': {'name': 'Coach name!'}
      },
    },
    {
      'title': 'Private Session 5',
      "description": 'Good Private Session',
      'duration': '02:34',
      'datetime': '2021-09-13 14:13:51',
      'price': '10.99',
      'coach': {
        'user': {'name': 'Coach name!'}
      },
    },
    {
      'title': 'Private Session 5',
      "description": 'Good Private Session',
      'duration': '02:34',
      'datetime': '2021-09-13 14:13:51',
      'price': '10.99',
      'coach': {
        'user': {'name': 'Coach name!'}
      },
    },
  ];

  String formatDuration(String duration) {
    String finalDuration = 'Duration: ';
    String hours = duration.substring(0, 2);
    if (hours != '00') {
      if (hours[0] == '0') {
        finalDuration += '${hours[1]}h';
      } else {
        finalDuration += '${hours}h';
      }
    }
    String minutes = duration.substring(3, 5);
    if (minutes != '00') {
      if (minutes[0] == '0') {
        finalDuration += ' ${minutes[1]}m';
      } else {
        finalDuration += ' ${minutes}m';
      }
    }
    if (duration.length == 8) {
      String seconds = duration.substring(6);
      if (seconds != '00') {
        if (seconds[0] == '0') {
          finalDuration += ' ${seconds[1]}s';
        } else {
          finalDuration += ' ${seconds}s';
        }
      }
    }
    return finalDuration;
  }

  String formatDateTime(String DateTime) {
    //2021-09-13 14:13:51
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    String year = DateTime.substring(0, 4);
    String month = DateTime.substring(5, 7);
    String day = DateTime.substring(8, 10);
    String time = DateTime.substring(12);
    return '$day ${months[int.parse(month) - 1]} $year at $time';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Colors.black,
        padding: EdgeInsetsDirectional.all(10),
        child: Stack(children: [
          ListView(
            children: [
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextFormField(
                    controller: TextEditingController(),
                    cursorColor: Theme.of(context).primaryColor,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                        hintText: 'Search..',
                        suffixIcon: Material(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(Icons.search),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  )),
              if (whoIsSelected != -1)
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Deselect Items  ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onTap: () {
                          setState(() {
                            whoIsSelected = -1;
                          });
                        },
                      )
                    ],
                  ),
                ),
              SizedBox(height: 20),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: privateSessions.length,
                  itemBuilder: (ctx, index) {
                    return myListTile(
                      privateSessions[index]['title'],
                      [
                        privateSessions[index]['coach']['user']['name'],
                        formatDateTime(privateSessions[index]['datetime']),
                        formatDuration(privateSessions[index]['duration']),
                      ],
                      '\$${privateSessions[index]['price']}',
                      index,
                    );
                  }),
            ],
          ),
          if (whoIsSelected != -1)
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      fixedSize: Size.fromWidth(width),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    var selectedPrivateSession = privateSessions[whoIsSelected];

                    selectedPrivateSession['datetime'] =
                        formatDateTime(selectedPrivateSession['datetime']);
                    selectedPrivateSession['duration'] =
                        formatDuration(selectedPrivateSession['duration']);
                    // Navigator.pop(context, selectedPrivateSession);
                  }),
            ),
        ]),
      ),
    );
  }

  Widget myListTile(
      String title, List<String> subtitles, String trailing, int index) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: whoIsSelected == index ? Colors.white24 : Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            whoIsSelected = index;
          });
        },
        selected: whoIsSelected == index,
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: FlutterLogo(),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (String subtitle in subtitles)
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
          ],
        ),
        trailing: Text(
          trailing,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
