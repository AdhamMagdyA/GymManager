import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;

  CustomListTile(this.title, this.subtitle1, this.subtitle2, this.subtitle3);
  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
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
        trailing: Column(
          children: [
            GestureDetector(
              child: Icon(
                Icons.add,
                size: 15,
                color: Colors.white,
              ),
              onTap: () {
                setState(() {
                  number++;
                });
              },
            ),
            Text(
              "${number}",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            GestureDetector(
              child: Icon(
                Icons.remove,
                size: 15,
                color: Colors.white,
              ),
              onTap: () {
                setState(() {
                  if (number == 0) {
                    number = 0;
                  } else {
                    number--;
                  }
                });
              },
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
