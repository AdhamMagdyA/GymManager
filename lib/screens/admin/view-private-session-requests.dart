import 'package:flutter/material.dart';

import 'package:gym_project/screens/common/view-private-session-details.dart';

class ViewPrivateSessionRequestsScreen extends StatefulWidget {
  @override
  _ViewPrivateSessionRequestsScreenState createState() =>
      _ViewPrivateSessionRequestsScreenState();
}

class _ViewPrivateSessionRequestsScreenState
    extends State<ViewPrivateSessionRequestsScreen> {
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
      'members': [
        {
          'user': {
            'name': 'Member name!',
          }
        }
      ],
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
      'members': [
        {
          'user': {
            'name': 'Member name!',
          }
        }
      ],
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
      'members': [
        {
          'user': {
            'name': 'Member name!',
          }
        }
      ],
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
      'members': [
        {
          'user': {
            'name': 'Member name!',
          }
        }
      ],
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
      'members': [
        {
          'user': {
            'name': 'Member name!',
          }
        }
      ],
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
      'members': [
        {
          'user': {
            'name': 'Member name!',
          }
        }
      ],
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
      'members': [
        {
          'user': {
            'name': 'Member name!',
          }
        }
      ],
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
      'members': [
        {
          'user': {
            'name': 'Member name!',
          }
        }
      ],
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
      'members': [
        {
          'user': {
            'name': 'Member name!',
          }
        }
      ],
    },
  ];

  String formatDateTime(String dateTime) {
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
    String year = dateTime.substring(0, 4);
    String month = dateTime.substring(5, 7);
    String day = dateTime.substring(8, 10);
    String time = dateTime.substring(12);
    return '$day ${months[int.parse(month) - 1]} $year at $time';
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      padding: EdgeInsetsDirectional.all(10),
      child: ListView(
        children: [
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
              itemCount: privateSessions.length,
              itemBuilder: (ctx, index) {
                return myListTile(
                  privateSessions[index]['title'],
                  [
                    privateSessions[index]['coach']['user']['name'],
                    privateSessions[index]['members'][0]['user']['name'],
                    formatDateTime(privateSessions[index]['datetime']),
                  ],
                  index,
                );
              }),
        ],
      ),
    );
  }

  Widget myListTile(String title, List<String> subtitles, int index) {
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
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ElevatedButton(
                  child: Text('Accept'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    // Navigator.pop(context, selectedPrivateSession);
                  }),
            ),
            SizedBox(height: 6),
            Expanded(
              child: ElevatedButton(
                  child: Text('Reject'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    // Navigator.pop(context, selectedPrivateSession);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
