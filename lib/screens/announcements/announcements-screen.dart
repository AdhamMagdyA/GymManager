import 'package:flutter/material.dart';
import 'package:gym_project/models/announcement.dart';
import 'package:gym_project/screens/announcements/add-announcement-screen.dart';
import 'package:gym_project/screens/announcements/announcements-list-tile.dart';
import 'package:gym_project/viewmodels/announcement-list-view-model.dart';
import 'package:gym_project/viewmodels/announcement-view-model.dart';
import 'package:gym_project/viewmodels/exercise-list-view-model.dart';
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
    Provider.of<AnnouncementListViewModel>(context, listen: false)
        .getAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    var announcements = Provider.of<AnnouncementListViewModel>(context);
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
                  for (AnnouncementViewModel announcement
                      in announcements.announcementList) {
                    print(announcement.title);
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAnnouncementScreen(
                        post_type: 'Add',
                      ),
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
            child: announcements.loadingstatus ==
                    AnnouncementLoadingStatus.Completed
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return AnnouncementsListTile(
                        id: announcements.announcementList[index].id,
                        title: announcements.announcementList[index].title,
                        body: announcements.announcementList[index].description,
                        date: announcements.announcementList[index].date,
                      );
                    },
                    itemCount: announcements.announcementList.length,
                    padding: const EdgeInsets.all(10),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Color(0xFFFFCE2B),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
