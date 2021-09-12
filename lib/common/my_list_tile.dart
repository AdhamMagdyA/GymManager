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
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        child: FlutterLogo(),
      ),
      title: Text(widget.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.subtitle1,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          Text(widget.subtitle2),
        ],
      ),
      trailing: Column(
        children: [
          GestureDetector(
            child: Icon(
              Icons.add,
              size: 15,
            ),
            onTap: () {
              setState(() {
                number++;
                print(number);
              });
            },
          ),
          Text(
            "${number}",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          GestureDetector(
            child: Icon(
              Icons.remove,
              size: 15,
            ),
            onTap: () {
              setState(() {
                if (number == 0) {
                  number = 0;
                } else {
                  number--;
                }
                print(number);
              });
            },
          )
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
