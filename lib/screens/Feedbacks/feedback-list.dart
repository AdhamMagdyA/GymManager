import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';
import 'package:gym_project/screens/Feedbacks/feedback-tile.dart';
import 'package:gym_project/screens/Invitations/invitaion-tile.dart';


class FeedbackList extends StatefulWidget {
  final String memberName = 'Mohamed Mounir';
  final String title = 'Feedback';
  final String description = 'da feedback 5ateer da feedback 5ateerda feedback 5ateerda feedback 5ateerda feedback 5ateerda feedback 5ateerda feedback 5ateerda feedback 5ateerda feedback 5ateerda feedback 5ateerda feedback 5ateerda feedback 5ateerda feedback 5ateer';

  FeedbackList();

  @override
  _FeedbackListState createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {
  final length = 5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          padding: EdgeInsetsDirectional.all(10),
          child: ListView(
            children: [
              Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFFFCE2B),
                      size: 22.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    //-->header
                    child: new Text('Feedbacks',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'sans-serif-light',
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
              SizedBox(height: 20),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    
                  itemCount: length,
                  itemBuilder: (ctx, index) {
                    return FeedbackTile('assets/images/feed2.png', widget.memberName,
                        widget.title, widget.description);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}