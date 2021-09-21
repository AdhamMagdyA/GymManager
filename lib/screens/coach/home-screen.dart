import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../style/styling.dart';
import '../../widget/popularCard.dart';

class CoachHomeScreen extends StatefulWidget {
  const CoachHomeScreen({Key key}) : super(key: key);

  @override
  _CoachHomeScreenState createState() => _CoachHomeScreenState();
}

class _CoachHomeScreenState extends State<CoachHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                /*SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Image.asset(
                      'assets/images/welcome.png',
                      fit: BoxFit.fill,
                    )),
                Image.asset(
                  'assets/images/Rectangle.png',
                  fit: BoxFit.fill,
                ),*/
                Column(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: PadRadius.horizontal - 15,
                          vertical: PadRadius.horizontal - 15,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Welcome ",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Color(0xFFFFCE2B),
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: "Coach",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white))
                                  ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height * 0.4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: PadRadius.horizontal - 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Upcoming Events",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'See More',
                                        style: TextStyle(
                                            color: Color(0xFFFFCE2B),
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                              SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: Row(children: getEvents()),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Classes",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'See More',
                                        style: TextStyle(
                                            color: Color(0xFFFFCE2B),
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                              SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: Row(children: getClasses()),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> getEvents() {
  List<Widget> events = [
    PopularCard(
      asset: "ht1",
      title: "Event 1",
    ),
    PopularCard(
      asset: "ht2",
      title: "Event 2",
    ),
    PopularCard(
      asset: "ht3",
      title: "Event 3",
    ),
  ];
  return events;
}

List<Widget> getClasses() {
  List<Widget> classes = [
    PopularCard(
      asset: "ht1",
      title: "Class 1",
    ),
    PopularCard(
      asset: "ht2",
      title: "Class 2",
    ),
    PopularCard(
      asset: "ht3",
      title: "Class 3",
    ),
  ];
  return classes;
}
