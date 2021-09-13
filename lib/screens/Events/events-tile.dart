import 'package:flutter/material.dart';

class EventListTile extends StatefulWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;

  EventListTile(this.title, this.subtitle1, this.subtitle2, this.subtitle3);
  @override
  _EventListTileState createState() => _EventListTileState();
}

class _EventListTileState extends State<EventListTile> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: FlutterLogo(),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.subtitle1,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              widget.subtitle2,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              widget.subtitle3,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        ),
    );
  }
}
