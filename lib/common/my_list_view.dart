import 'package:flutter/material.dart';

import 'my_list_tile.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
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

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (ctx, index) {
            return CustomListTile(
                'Main Title', 'Subtitle 1', 'Subtitle 2', 'Subtitle 3');
          }),
    );
  }
}
