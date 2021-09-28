import 'package:flutter/material.dart';
import 'package:gym_project/style/styling.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class EquipmentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Provider.of<User>(context, listen: false).role == "admin"
              ? Container(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit-equipment');
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
                        child: new Text('Equipment Info',
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
                    'assets/images/OIP.jfif',
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
                        "Dumble",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ),
                      ),
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
