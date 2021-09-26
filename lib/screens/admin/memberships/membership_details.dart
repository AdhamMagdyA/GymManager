import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_project/style/styling.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class MembershipDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton:
          Provider.of<User>(context, listen: false).role == "admin"
              ? Container(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit-membership');
                    },
                    isExtended: false,
                    label: Icon(Icons.edit),
                  ),
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.1,
                )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
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
                        child: new Text('Membership Info',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/membership.jfif',
                    fit: BoxFit.cover,
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                      child: Text(
                        "Gold Membership",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("\$55",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 20.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              )),
                          Text(" - ",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 10.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              )),
                          Text("\$60",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                color: Colors.amber[200],
                                fontSize: 20.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              )),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text(
                    "Maadi Branch",
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Card(
                          color: Colors.white12,
                          child: ListTile(
                            title: Text(
                              "Classes",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 14.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              "30",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 10.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                    Flexible(
                      child: Card(
                          color: Colors.white12,
                          child: ListTile(
                            title: Text(
                              "Freeze",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 14.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              "10 days",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 10.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                    Flexible(
                      child: Card(
                          color: Colors.white12,
                          child: ListTile(
                            title: Text(
                              "Duration",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 14.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              "2 months",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 10.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  ],
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text("Description",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ))),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin psum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignidignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15.0,
                      fontFamily: 'assets/fonts/ProximaNova-Regular.otf',
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
