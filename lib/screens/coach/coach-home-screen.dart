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
  final supplements = [
    {'title': 'Supp.1', 'price': 14.99},
    {'title': 'Supp.2', 'price': 14.99},
    {'title': 'Supp.3', 'price': 14.99},
    {'title': 'Supp.4', 'price': 14.99},
    {'title': 'Supp.5', 'price': 14.99},
  ];
  final announcements = [
    {'title': 'announcement 1', 'dateTime': DateTime.now(), 'sender': 'User1'},
    {'title': 'announcement 2', 'dateTime': DateTime.now(), 'sender': 'User2'},
    {'title': 'announcement 3', 'dateTime': DateTime.now(), 'sender': 'User2'},
    {'title': 'announcement 4', 'dateTime': DateTime.now(), 'sender': 'User2'},
    {'title': 'announcement 5', 'dateTime': DateTime.now(), 'sender': 'User2'},
  ];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = events[0]['startTime'] as DateTime;

    return SingleChildScrollView(
      child: Column(
        children: [
          CrowdMeter(
              checkedInMembers: checkedInMembers, totalMembers: totalMembers),
          SizedBox(height: 20),
          HomeEventsList(events: events),
          SizedBox(
            height: 20,
          ),
          HomeSupplementsList(supplements: supplements),
          SizedBox(
            height: 20,
          ),
          HomeAnnouncementsList(announcements: announcements)
        ],
      ),
    );
  }
}

class HomeEventsList extends StatelessWidget {
  const HomeEventsList({
    Key key,
    @required this.events,
  }) : super(key: key);

  final List<Map<String, Object>> events;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Events',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 170,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (_, i) {
                DateTime dateTime = events[0]['startTime'] as DateTime;
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage('https://picsum.photos/300/300'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          // color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        events[i]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('5th Jan 2021'),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class HomeSupplementsList extends StatelessWidget {
  const HomeSupplementsList({
    Key key,
    @required this.supplements,
  }) : super(key: key);

  final List<Map<String, Object>> supplements;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Supplements',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 170,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: supplements.length,
              itemBuilder: (_, i) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage('https://picsum.photos/300/300'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          // color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        supplements[i]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('\$${supplements[i]['price']}'),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class HomeAnnouncementsList extends StatelessWidget {
  const HomeAnnouncementsList({
    Key key,
    @required this.announcements,
  }) : super(key: key);

  final List<Map<String, Object>> announcements;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Announcements',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.builder(
              itemCount: announcements.length,
              itemBuilder: (_, i) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Column(
                    children: [
                      // Container(
                      //   height: 100,
                      //   width: MediaQuery.of(context).size.width * 0.2,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image:
                      //           NetworkImage('https://picsum.photos/300/300'),
                      //       fit: BoxFit.cover,
                      //     ),
                      //     borderRadius: BorderRadius.circular(10),
                      //     // color: Color(0xFF000000),
                      //   ),
                      // ),

                      // SizedBox(
                      //   height: 50,
                      // ),
                      Text(
                        announcements[i]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('lorem ipsum dolor description'),
                      Text('5th Jan 2021'),
                      Text('${announcements[i]['sender']}'),
                    ],
                  ),
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
