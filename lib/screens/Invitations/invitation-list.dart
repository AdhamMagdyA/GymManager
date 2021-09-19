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
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsetsDirectional.all(10),
        child: ListView(
          children: [
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
    );
  }
}