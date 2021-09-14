import 'package:flutter/material.dart';
import 'package:gym_project/widget/grid_view_card.dart';

class SetDetailsScreen extends StatelessWidget {
  var _set = {
    'id': 1,
    'title': "Set 1",
    'description':
        "Fugit excepturi ipsa consequatur nobis quas deserunt delectus. Voluptatem omnis totam explicabo illo quo. Ipsa repellat consequatur nostrum doloribus odio porro. Voluptatibus ut reprehenderit similique quas odit eveniet consequatur.",
    'coach_id': 5,
    'created_at': "2021-09-14 08:29:15",
    'updated_at': "2021-09-14 08:29:15",
    'exercises': [
      {
        'id': 1,
        'description':
            "Voluptas eius dolore illo est eum pariatur asperiores. Vel ea recusandae neque eveniet facere vero omnis. Porro temporibus voluptatum aliquam explicabo rerum eaque. Quia non corrupti sunt quia vero. Similique temporibus porro mollitia et sit alias.",
        'duration': "06:04",
        'gif':
            "http://breitenberg.biz/qui-consectetur-unde-eveniet-illo-eius-architecto-quisquam.html",
        'cal_burnt': 28.95,
        'title': "Exercise 1",
        'reps': 6,
        'image':
            "https://media.istockphoto.com/photos/kettlebell-and-medicine-ball-in-the-gym-equipment-for-functional-picture-id1153479113?k=20&m=1153479113&s=612x612&w=0&h=wLZnQE2GPjXJFYVpygKlNK5iyD8THMyPOGG4qFGr3xE=",
        'coach_id': 5,
        'created_at': "2021-09-14 08:29:10",
        'updated_at': "2021-09-14 08:29:10",
        'pivot': {
          'set_id': 1,
          'exercise_id': 1,
          'created_at': "2021-09-14 08:29:23",
          'updated_at': "2021-09-14 08:29:23",
          'break_duration': "01:00",
        },
      },
      {
        'id': 7,
        'description': "description",
        'duration': "08:32",
        'gif':
            "http://breitenberg.net/aut-corporis-doloremque-omnis-est-ea-quidem-magni-eum",
        'cal_burnt': 10.46,
        'title': "Exercise 2",
        'reps': 4,
        'image':
            "https://media.istockphoto.com/photos/kettlebell-and-medicine-ball-in-the-gym-equipment-for-functional-picture-id1153479113?k=20&m=1153479113&s=612x612&w=0&h=wLZnQE2GPjXJFYVpygKlNK5iyD8THMyPOGG4qFGr3xE=",
        'coach_id': 5,
        'created_at': "2021-09-14 08:29:12",
        'updated_at': "2021-09-14 08:29:12",
        'pivot': {
          'set_id': 1,
          'exercise_id': 7,
          'created_at': "2021-09-14 08:29:23",
          'updated_at': "2021-09-14 08:29:23",
          'break_duration': "01:00",
        },
      },
      {
        'id': 7,
        'description': "description",
        'duration': "08:32",
        'gif':
            "http://breitenberg.net/aut-corporis-doloremque-omnis-est-ea-quidem-magni-eum",
        'cal_burnt': 10.46,
        'title': "Exercise 2",
        'reps': 4,
        'image':
            "https://media.istockphoto.com/photos/kettlebell-and-medicine-ball-in-the-gym-equipment-for-functional-picture-id1153479113?k=20&m=1153479113&s=612x612&w=0&h=wLZnQE2GPjXJFYVpygKlNK5iyD8THMyPOGG4qFGr3xE=",
        'coach_id': 5,
        'created_at': "2021-09-14 08:29:12",
        'updated_at': "2021-09-14 08:29:12",
        'pivot': {
          'set_id': 1,
          'exercise_id': 7,
          'created_at': "2021-09-14 08:29:23",
          'updated_at': "2021-09-14 08:29:23",
          'break_duration': "01:00",
        },
      },
      {
        'id': 7,
        'description': "description",
        'duration': "08:32",
        'gif':
            "http://breitenberg.net/aut-corporis-doloremque-omnis-est-ea-quidem-magni-eum",
        'cal_burnt': 10.46,
        'title': "Exercise 2",
        'reps': 4,
        'image':
            "https://media.istockphoto.com/photos/kettlebell-and-medicine-ball-in-the-gym-equipment-for-functional-picture-id1153479113?k=20&m=1153479113&s=612x612&w=0&h=wLZnQE2GPjXJFYVpygKlNK5iyD8THMyPOGG4qFGr3xE=",
        'coach_id': 5,
        'created_at': "2021-09-14 08:29:12",
        'updated_at': "2021-09-14 08:29:12",
        'pivot': {
          'set_id': 1,
          'exercise_id': 7,
          'created_at': "2021-09-14 08:29:23",
          'updated_at': "2021-09-14 08:29:23",
          'break_duration': "01:00",
        },
      },
    ],
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
    var exercise1 = _set['exercises'];
    // for (Map<String, Object> one in exercise1) {
    //   print(one['id']);
    // }
    // exercise1.map((e) {
    //   print('here');
    //   print(e['id']);
    // });
    // print(exercise1.runtimeType);
    // print(exercise1);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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
                  _set['title'],
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  _set['description'],
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
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Exercises",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                  ),
                ),
              ),
              CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(26.0),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: <Widget>[
                        for (Map<String, Object> exercise in _set['exercises'])
                          GridViewCard(
                              exercise['image'],
                              exercise['title'],
                              '${exercise['reps']} repetitions',
                              formatDuration(exercise['duration']),
                              '${exercise['cal_burnt']} cal',
                              '')
                      ],
                    ),
                  ),
                ],
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
    );
  }
}
