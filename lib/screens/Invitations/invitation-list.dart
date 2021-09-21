import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';
import 'package:gym_project/screens/Invitations/invitaion-tile.dart';


class InvitationList extends StatefulWidget {
  final String memberName = 'Mohamed Mounir';
  final String guestName = 'Tamer Hosny';
  final String guestPhoneNumber = '01234567890';

  InvitationList();

  @override
  _InvitationListState createState() => _InvitationListState();
}

class _InvitationListState extends State<InvitationList> {
  final length = 10;

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
                    child: new Text('Invitations',
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
                  physics: NeverScrollableScrollPhysics(),
    
                  itemCount: length,
                  itemBuilder: (ctx, index) {
                    return InvitationTile('assets/images/invite.png', widget.memberName,
                        widget.guestName, widget.guestPhoneNumber);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}