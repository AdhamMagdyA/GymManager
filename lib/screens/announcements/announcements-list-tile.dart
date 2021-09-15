import 'package:flutter/material.dart';

class AnnouncementsListTile extends StatefulWidget {
  final String title;
  final String body;
  final String date;
  final String role; // member or admin

  AnnouncementsListTile(this.title, this.body, this.date, this.role);
  @override
  _AnnouncementsListTileState createState() => _AnnouncementsListTileState();
}

class _AnnouncementsListTileState extends State<AnnouncementsListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        isThreeLine: true,
        //onTap: widget.ontap,
        //trailing:
        minVerticalPadding: 10,
        title: Padding(
          padding: const EdgeInsets.only(
              right: 0.0, top: 8.0, bottom: 8.0, left: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
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
              widget.role == "admin"
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 8),
          child: Column(
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
      ),
    );
  }
}
