import 'package:flutter/material.dart';

class CoachHomeScreen extends StatelessWidget {
  CoachHomeScreen({Key key}) : super(key: key);

  final checkedInMembers = 60;
  final totalMembers = 100;
  final events = [
    {'title': 'event 1', 'startTime': DateTime.now()},
    {'title': 'event 2', 'startTime': DateTime.now()},
    {'title': 'event 3', 'startTime': DateTime.now()},
    {'title': 'event 4', 'startTime': DateTime.now()},
    {'title': 'event 5', 'startTime': DateTime.now()},
  ];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = events[0]['startTime'] as DateTime;

    return Column(
      children: [
        CrowdMeter(
            checkedInMembers: checkedInMembers, totalMembers: totalMembers),
        SizedBox(height: 20),
        Container(
          height: 200,
          child: PageView.builder(
              controller: PageController(viewportFraction: 0.35),
              itemCount: events.length,
              itemBuilder: (_, i) {
                DateTime dateTime = events[0]['startTime'] as DateTime;
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: GridTile(
                      child: Image.network(
                        'https://picsum.photos/300/300',
                        fit: BoxFit.cover,
                      ),
                      footer: Column(
                        children: [
                          Text(events[i]['title']),
                          Text('starts at: ${dateTime.toIso8601String()}'),
                        ],
                      ),
                    )

                    // Column(
                    //   children: [
                    //     Image.network('https://picsum.photos/100/50'),
                    //     Text(events[i]['title']),
                    //     Text('starts at: ${dateTime.toIso8601String()}'),
                    //   ],
                    // ),
                    );
              }),
        ),
      ],
    );
  }
}

class CrowdMeter extends StatelessWidget {
  const CrowdMeter({
    Key key,
    @required this.checkedInMembers,
    @required this.totalMembers,
  }) : super(key: key);

  final int checkedInMembers;
  final int totalMembers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Text('Crowd Meter'),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(100),
          ),
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: checkedInMembers / totalMembers,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text('Current Members: $checkedInMembers'),
      ],
    );
  }
}
