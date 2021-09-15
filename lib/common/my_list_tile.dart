import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final List<String> subtitles;
  String trailing = '';

  CustomListTile(this.title, this.subtitles, {this.trailing});
  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
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
            for (String subtitle in widget.subtitles)
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
          ],
        ),
        trailing: Text(widget.trailing),
      ),
    );
  }
}
