import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';

class MembershipsList extends StatefulWidget {
  final String title = 'Gold Membership';
  final String subtitle1 = '30 Classes';
  final String subtitle2 = '\$50';
  final String subtitle3 = '1 month';

  MembershipsList();

  @override
  _MembershipsListState createState() => _MembershipsListState();
}

class _MembershipsListState extends State<MembershipsList> {
  final length = 12;

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/create-membership');
          },
          isExtended: false,
          label: Icon(Icons.add),
        ),
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
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
                    child: new Text('Memberships List',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'sans-serif-light',
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
            Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: TextEditingController(text: 'Search...'),
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      suffixIcon: Material(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(Icons.search),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                )),
            SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/membership-details');
                    },
                    child: CustomListTileWithoutCounter(
                        'assets/images/membership.png',
                        widget.title,
                        widget.subtitle1,
                        widget.subtitle2,
                        widget.subtitle3),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
