import 'package:flutter/material.dart';

class InvitationTile extends StatefulWidget {
  final String path;
  final String memberName;
  final String guestName;
  final String guestPhoneNumber;

  InvitationTile(this.path, this.memberName, this.guestName, this.guestPhoneNumber);

  @override
  _InvitationTileState createState() => _InvitationTileState();
}

class _InvitationTileState extends State<InvitationTile> {
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text("Member : " ,style:TextStyle(color: Colors.amberAccent) ,),
                Text(
                  widget.memberName,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Text("Guest : ",style: TextStyle(color: Colors.amberAccent),),
                Text(
                  widget.guestName,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Text("Guest Number : ",style: TextStyle(color: Colors.amberAccent),),
                Text(
                  widget.guestPhoneNumber,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        
      ),
    );
  }
}