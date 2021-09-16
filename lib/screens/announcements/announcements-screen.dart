import 'package:flutter/material.dart';
import 'package:gym_project/screens/announcements/add-announcement-screen.dart';
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAnnouncementScreen(),
                  ),
                );
              },
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
                title: "Announcement 1",
                body:
                    "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc",
                date: "18-9-2021 at 7:00 PM",
                role: "admin",
                id: 1,
              ),
              AnnouncementsListTile(
                title: "Announcement 2",
                body:
                    "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc",
                date: "18-9-2021 at 6:00 PM",
                role: "admin",
                id: 2,
              ),
              AnnouncementsListTile(
                title: "Announcement 3",
                body:
                    "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc",
                date: "18-9-2021 at 5:00 PM",
                role: "admin",
                id: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
