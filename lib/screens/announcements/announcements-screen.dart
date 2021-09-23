import 'package:flutter/material.dart';
import 'package:gym_project/screens/announcements/add-announcement-screen.dart';
import 'package:gym_project/screens/announcements/announcements-list-tile.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

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
    user_role = Provider.of<User>(context, listen: false).role;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: user_role != "admin"
          ? AppBar(
              title: Text(
                'Announcements',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xff181818),
              iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
            )
          : PreferredSize(child: Container(), preferredSize: Size(0, 0)),
      floatingActionButton: user_role == "admin"
          ? Container(
              height: MediaQuery.of(context).size.height * 0.075,
              width: MediaQuery.of(context).size.width * 0.1,
              child: FloatingActionButton(
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
                  color: Colors.black,
                ),
              ),
            )
          : Container(),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                AnnouncementsListTile(
                  title: "Announcement 1",
                  body:
                      "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc",
                  date: "18-9-2021 at 7:00 PM",
                  id: 1,
                ),
                AnnouncementsListTile(
                  title: "Announcement 2",
                  body:
                      "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc",
                  date: "18-9-2021 at 6:00 PM",
                  id: 2,
                ),
                AnnouncementsListTile(
                  title: "Announcement 3",
                  body:
                      "Nam id varius sapien. Vestibulum rhoncus viverra ligula eu tempor. Praesent accumsan libero ut venenatis sodales. Donec convallis cursus lectus in egestas. Aenean ullamcorper, libero ac cursus viverra, ante sapien scelerisque nunc",
                  date: "18-9-2021 at 5:00 PM",
                  id: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
