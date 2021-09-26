import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/common/my_choosing_screen.dart';
import 'package:gym_project/common/my_list_tile.dart';

import 'package:flutter/material.dart';
import 'package:gym_project/screens/coach/private%20sessions/edit-private-session.dart';
import 'package:gym_project/screens/common/view-private-session-details.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class ViewMyPrivateSessionsScreen extends StatefulWidget {
  @override
  _ViewMyPrivateSessionsScreenState createState() =>
      _ViewMyPrivateSessionsScreenState();
}

class _ViewMyPrivateSessionsScreenState
    extends State<ViewMyPrivateSessionsScreen> {
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
    return Scaffold(
      appBar: Provider.of<User>(context, listen: false).role == "member" ||
              Provider.of<User>(context, listen: false).role == "admin"
          ? AppBar(
              title: Text(
                'Private Sessions',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xff181818),
              iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
            )
          : PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(),
            ),
      body: SafeArea(
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    )),
                SizedBox(height: 20),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: privateSessions.length,
                    itemBuilder: (ctx, index) {
                      return myListTile(
                        privateSessions[index],
                        index,
                      );
                    }),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget myListTile(Map privateSession, int index) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PrivateSessionDetailsScreen()));
        },
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: FlutterLogo(),
        ),
        title: Text(
          privateSession['title'],
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              privateSession['coach']['user']['name'],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              formatDateTime(privateSession['datetime']),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              formatDuration(privateSession['duration']),
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
        trailing: Column(
          children: [
            Text(
              '\$${privateSession['price']}',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              child: TextButton(
                onPressed: Provider.of<User>(context).role == "admin" ||
                        Provider.of<User>(context).role == "coach"
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditPrivateSessionForm(privateSession)));
                      }
                    : () {},
                child: Provider.of<User>(context).role == "admin" ||
                        Provider.of<User>(context).role == "coach"
                    ? Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
