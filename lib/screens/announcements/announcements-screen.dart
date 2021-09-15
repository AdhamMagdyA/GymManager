import 'package:flutter/material.dart';
import 'package:gym_project/screens/announcements/announcements-list-tile.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({Key key}) : super(key: key);

  @override
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  String user_role;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user_role = "admin";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: user_role == "admin"
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Color(0xFF181818),
            )
          : Container(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              AnnouncementsListTile(
                  "Announcement 1",
                  "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc",
                  "18-9-2021 at 7:00 PM",
                  "admin"),
              AnnouncementsListTile(
                  "Announcement 2",
                  "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc",
                  "18-9-2021 at 6:00 PM",
                  "admin"),
              AnnouncementsListTile(
                  "Announcement 3",
                  "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc",
                  "18-9-2021 at 5:00 PM",
                  "admin"),
            ],
          ),
        ),
      ),
    );
  }
}
