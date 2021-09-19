import 'package:flutter/material.dart';

class AnswersListTile extends StatefulWidget {
  final String title;
  final String body;
  final String date;

  AnswersListTile(this.title, this.body, this.date);
  @override
  _AnswersListTileState createState() => _AnswersListTileState();
}

class _AnswersListTileState extends State<AnswersListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      /*decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),*/
      child: ListTile(
        isThreeLine: true,
        minVerticalPadding: 10,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.account_circle),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.date,
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              /*Text(
                widget.date,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 12,
                  fontFamily: 'assets/fonts/Changa-Bold.ttf',
                ),
              ),*/
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.body,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
