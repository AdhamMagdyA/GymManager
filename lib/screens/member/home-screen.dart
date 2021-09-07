import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_project/screens/common/login-screen.dart';
import 'package:gym_project/widget/drawer.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import '../../style/styling.dart';
import '../../style/text.dart';
import '../../widget/homeCategory.dart';
import '../../widget/popularCard.dart';

class MemberHomeScreen extends StatefulWidget {
  const MemberHomeScreen({Key key}) : super(key: key);

  @override
  _MemberHomeScreenState createState() => _MemberHomeScreenState();
}

class _MemberHomeScreenState extends State<MemberHomeScreen> {
  MotionTabController _tabController;
  int _selectedIndex = 0;

  final _pages = [
    {
      'page': Login(),
      'title': 'Categories',
    },
    {
      'page': Login(),
      'title': 'Your Favorite',
    },
    {
      'page': Material(),
      'title': 'Your Favorite',
    },
    {
      'page': Material(),
      'title': 'Your Favorite',
    },
    {
      'page': Material(),
      'title': 'Your Favorite',
    },
  ];
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
                                        text: "Member",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white))
                                  ]),
                                ),
                              ],
                            ),
                            Container(
                              child: Text('Crowd Meter'),
                              margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
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
