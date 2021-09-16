import 'package:flutter/material.dart';
import 'package:gym_project/screens/Events/event-details.dart';

class EventListTile extends StatefulWidget {
  final String title;
  final String price;
  final String date;
  final String startTime;
  final String endTime;
  final String icon;


  EventListTile(this.title, this.price, this.date, this.startTime,this.endTime,this.icon);
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(color: Colors.amberAccent, fontFamily: 'assets/fonts/Changa-Bold.ttf' ),
            ),
            Text(
              widget.price,
              style: TextStyle(color: Colors.white70, fontFamily: 'assets/fonts/Changa-Bold.ttf' ),
            ),
          ],

        ),
        
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),
            Text(
              widget.date,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              widget.startTime,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsScreen()));},
        ),
    );
  }
}
