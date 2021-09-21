import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                        child: new Text('About Us',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontFamily: 'sans-serif-light',
                                color: Colors.white)),
                      )
                    ],
                  )),
              new SingleChildScrollView(
                padding: EdgeInsets.only(left: 5, right: 20),
                scrollDirection: Axis.horizontal,
                child: new Row(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/gym.jpg',
                        fit: BoxFit.cover,
                      ),
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Container(
                      child: Image.asset(
                        'images/gym.jpg',
                        fit: BoxFit.cover,
                      ),
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Container(
                      child: Image.asset(
                        'images/gym.jpg',
                        fit: BoxFit.cover,
                      ),
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Container(
                      child: Image.asset(
                        'images/gym.jpg',
                        fit: BoxFit.cover,
                      ),
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Container(
                      child: Image.asset(
                        'images/gym.jpg',
                        fit: BoxFit.cover,
                      ),
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    // ...
                  ],
                ),
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
                      "Gym Information",
                      style: TextStyle(
                        color: Color(0xFFFFCE2B),
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
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Text("About Us",
                      style: TextStyle(
                        color: Color(0xFFFFCE2B),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      ))),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin psum dolor sit amet, consectetur adipiscing elconsectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor sit amet, consectetur adipiscing elit. Proin dignipsum dolor s. Donec et eleifend quam, a sollicitudin magna.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 15.0,
                    fontFamily: 'assets/fonts/ProximaNova-Regular.otf',
                  ),
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Text("Conact Us",
                      style: TextStyle(
                        color: Color(0xFFFFCE2B),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      ))),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  "Call : 0101111111111\nEmail : gym@gamil.com",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 15.0,
                    fontFamily: 'assets/fonts/ProximaNova-Regular.otf',
                  ),
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Text("Location",
                      style: TextStyle(
                        color: Color(0xFFFFCE2B),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'assets/fonts/Changa-Bold.ttf',
                      ))),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  "12 example St, .... ",
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
    );
  }
}
