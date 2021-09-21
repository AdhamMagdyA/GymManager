import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:gym_project/widget/grid_view_card.dart';

class PrivateSessionDetailsScreen extends StatelessWidget {
  var _privateSession = {
    'id': 1,
    'title': "Session 1",
    'description':
        "Explicabo dignissimos repudiandae numquam recusandae et. Quis est repellat molestiae temporibus est numquam. Dolorum velit voluptas enim vero.",
    'link': "http://www.corkery.com/doloribus-officiis-maiores-ex-ducimus",
    'duration': "12:59",
    'datetime': "2021-10-05 16:38:15",
    'price': 43.65,
    'coach_id': 2,
    'created_at': "2021-09-14 08:29:20",
    'updated_at': "2021-09-14 08:29:20",
    'coach': {
      'id': 2,
      ' is_checked': 0,
      'created_at': "2021-09-14 08:28:22",
      'updated_at': "2021-09-14 08:28:22",
      ' user_id': 8,
      'user': {
        'id': 8,
        'name': "Scotty Becker",
        'number': "702-858-2594",
        'email': "graciela45@example.org",
        'email_verified_at': "2021-09-14 08:28:16",
        'role': "coach",
        ' #password': "password",
        '#remember_token': "Z2DwmAL7ng",
        'created_at': "2021-09-14 08:28:18",
        'updated_at': "2021-09-14 08:28:18",
      },
    },
    'members': {
      'all': [],
    },
  };
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

  @override
  Widget build(BuildContext context) {
    //need to get coach name

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  child: Image.network(
                    "https://media.istockphoto.com/photos/kettlebell-and-medicine-ball-in-the-gym-equipment-for-functional-picture-id1153479113?k=20&m=1153479113&s=612x612&w=0&h=wLZnQE2GPjXJFYVpygKlNK5iyD8THMyPOGG4qFGr3xE=",
                    fit: BoxFit.fill,
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                  child: Text(
                    _privateSession['title'],
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                  child: Text(
                    "Coach:",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    _privateSession['description'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15.0,
                      fontFamily: 'assets/fonts/ProximaNova-Regular.otf',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "Session Link",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    _privateSession['link'],
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
