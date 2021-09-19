import 'package:flutter/material.dart';

class CustomListTileWithoutCounter extends StatefulWidget {
  final String path;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;

  CustomListTileWithoutCounter(
      this.path, this.title, this.subtitle1, this.subtitle2, this.subtitle3);

  @override
  _CustomListTileWithoutCounterState createState() =>
      _CustomListTileWithoutCounterState();
}

class _CustomListTileWithoutCounterState
    extends State<CustomListTileWithoutCounter> {
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
          child: Image.asset(widget.path),
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
              style: TextStyle(color: Colors.white60),
            ),
            Text(
              widget.subtitle2,
              style: TextStyle(color: Colors.white60),
            ),
            Text(
              widget.subtitle3,
              style: TextStyle(color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
