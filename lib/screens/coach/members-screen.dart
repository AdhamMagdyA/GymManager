import 'package:flutter/material.dart';
// import 'package:gym_project/screens/nutritionist/fitness-summaries.dart';
// import 'package:gym_project/screens/nutritionist/fitness-summary.dart';

class MembersScreen extends StatelessWidget {
  MembersScreen({Key key}) : super(key: key);

  final List<dynamic> users = [
    {
      'name': 'Osama',
      'branch': 'Branch 1',
      "photo":
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
    },
    {
      'name': 'Abdo',
      'branch': 'Branch 2',
      "photo":
          'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => FitnessSummariesScreen()),
                // );
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              selectedTileColor: Colors.yellow,
              subtitle: Text(users[index]['branch']),
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(users[index]['photo']),
              ),
              title: Text(users[index]['name']),
            );
          }),
    );
  }
}
