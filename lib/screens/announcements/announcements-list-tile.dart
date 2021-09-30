import 'package:flutter/material.dart';
import 'package:gym_project/screens/announcements/add-announcement-screen.dart';
import 'package:gym_project/viewmodels/announcement-list-view-model.dart';
import 'package:gym_project/viewmodels/login-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class AnnouncementsListTile extends StatefulWidget {
  final String title;
  final String body;
  final String date;
  final String role; // member or admin
  final int id;

  AnnouncementsListTile({this.title, this.body, this.date, this.id, this.role});
  @override
  _AnnouncementsListTileState createState() => _AnnouncementsListTileState();
}

class _AnnouncementsListTileState extends State<AnnouncementsListTile> {
  bool is_visible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    is_visible = true;
    //widget.role = Provider.of<LoginViewModel>(context, listen: false).role;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: is_visible,
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 10),
        decoration: BoxDecoration(
          color: Color(0xff181818),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          isThreeLine: true,
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.58,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.date,
                        style: TextStyle(
                          color: Color(0xFFFFCE2B),
                          fontSize: 12,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ),
                      ),
                    ),
                  ],
                ),
                widget.role == "admin"
                    ? Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Color(0xFF181818),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Color(0xFF181818)),
                                    ),
                                    content: Text(
                                      "Would you like to delete this announcement ?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            'assets/fonts/Changa-Bold.ttf',
                                        fontSize: 15,
                                      ),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          MaterialButton(
                                            onPressed: () async {
                                              await Provider.of<
                                                          AnnouncementListViewModel>(
                                                      context,
                                                      listen: false)
                                                  .deleteAnnouncement(
                                                      widget.id);
                                              setState(() {
                                                is_visible = false;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("YES"),
                                            color: Color(0xFFFFCE2B),
                                            shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                color: Color(0xFFFFCE2B),
                                              ),
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("NO"),
                                            color: Color(0xFFFFCE2B),
                                            shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                color: Color(0xFFFFCE2B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddAnnouncementScreen(
                                      body: widget.body,
                                      title: widget.title,
                                      post_type: 'Edit',
                                      id: widget.id,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
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
      ),
    );
  }
}
