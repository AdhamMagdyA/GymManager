import 'package:flutter/material.dart';
import 'package:gym_project/core/presentation/res/text_styles.dart';
import 'package:gym_project/screens/admin/crowd_meter.dart';
import 'package:gym_project/screens/admin/equipment/equipment_list.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class BranchDetails extends StatefulWidget {
  const BranchDetails({Key key}) : super(key: key);

  @override
  _BranchDetailsState createState() => _BranchDetailsState();
}

class _BranchDetailsState extends State<BranchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Provider.of<User>(context, listen: false).role == "admin"
              ? Container(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit-branch');
                    },
                    isExtended: false,
                    label: Icon(Icons.edit),
                  ),
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.1,
                )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      backgroundColor: Colors.black,
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
                        child: new Text('Branch Info',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontFamily: 'sans-serif-light',
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/branch.jfif',
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
                        "Maadi Branch",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 20.0, top: 10.0, bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Call us: ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'assets/fonts/Changa-Bold.ttf',
                                ),
                              ),
                              Text(
                                "0101111002",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'assets/fonts/Changa-Bold.ttf',
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "11 street 9, Maadi, Cairo",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.amber,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 20.0),
                          Text("250 seats",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ))
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Card(
                          color: Colors.white12,
                          child: ListTile(
                            title: Text(
                              "Coches",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 14.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              "50",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 12.0,
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
                              "Nutritionists",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 14.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              "50",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 12.0,
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
                              "Members",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 14.0,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              "50",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 12.0,
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
                    child: Text("Info",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ))),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/equipment-list');
                    },
                    child: const Text('View Equipment'),
                  ),
                ),
                Container(
                  child: CrowdMeter(
                    checkedInMembers: 60,
                    totalMembers: 100,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
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
