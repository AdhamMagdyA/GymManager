import 'package:flutter/material.dart';

class OthersScreen extends StatelessWidget {
  const OthersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Create'),
        ),
        ListTile(
          title: Text('crowd meter'),
        ),
        ListTile(
          title: Text('announcements'),
        ),
        ListTile(
          title: Text('Q&A'),
        ),
        ListTile(
          title: Text('supplements'),
        ),
        ListTile(
          title: Text('events'),
        ),
      ],
    );
  }
}
