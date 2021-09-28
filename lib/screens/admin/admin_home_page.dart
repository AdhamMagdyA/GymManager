import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gym_project/widget/piechart.dart';

class AdminHomePage extends StatelessWidget {
  AdminHomePage({Key key}) : super(key: key);

  double width;
  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget _categoryRow(
    String title,
    Color primary,
    Color textColor,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          InkWell(
            onTap: () {},
            child: _chip("See all", primary),
          ),
        ],
      ),
    );
  }

  Widget _featuredRowBranches() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _card(
                primary: Colors.white,
                backWidget: _decorationContainerA(Color(0xFFFFCE2B), 50, -30),
                chipColor: Colors.black,
                chipText1: "El Mokattam Branch",
                chipText2: "67/150",
                isPrimaryCard: true),
            _card(
              primary: Colors.white,
              chipColor: Colors.black,
              backWidget: _decorationContainerB(Color(0xFFFFCE2B), 90, -40),
              chipText1: "El Maadi 9th Branch",
              chipText2: "67/150",
            ),
            _card(
              primary: Colors.white,
              chipColor: Colors.black,
              backWidget: _decorationContainerB(Color(0xFFFFCE2B), 90, -40),
              chipText1: "El Mohandeseen Branch",
              chipText2: "67/150",
            ),
            _card(
              primary: Colors.white,
              chipColor: Colors.black,
              backWidget: _decorationContainerB(Color(0xFFFFCE2B), 90, -40),
              chipText1: "6th Of October Branch",
              chipText2: "67/150",
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuredRowClasses() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _card(
                primary: Colors.white,
                backWidget: _decorationContainerA(Color(0xFFFFCE2B), 50, -30),
                chipColor: Colors.black,
                chipText1: "Zuumba",
                chipText2: "2000 Member",
                isPrimaryCard: true),
            _card(
              primary: Colors.white,
              chipColor: Colors.black,
              backWidget: _decorationContainerB(Color(0xFFFFCE2B), 90, -40),
              chipText1: "Yoga",
              chipText2: "1500  Member",
            ),
            _card(
              primary: Colors.white,
              chipColor: Colors.black,
              backWidget: _decorationContainerB(Color(0xFFFFCE2B), 90, -40),
              chipText1: "Stretching",
              chipText2: "1100  Member",
            ),
            _card(
              primary: Colors.white,
              chipColor: Colors.black,
              backWidget: _decorationContainerB(Color(0xFFFFCE2B), 90, -40),
              chipText1: "Hoola Hoops",
              chipText2: "710  Member",
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuredRowEvents() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _card(
                primary: Colors.white,
                backWidget: _decorationContainerA(Color(0xFFFFCE2B), 50, -30),
                chipColor: Colors.black,
                chipText1: "Meeting",
                chipText2: "22/6",
                isPrimaryCard: true),
            _card(
              primary: Colors.white,
              chipColor: Colors.black,
              backWidget: _decorationContainerB(Color(0xFFFFCE2B), 90, -40),
              chipText1: "Party",
              chipText2: "23/7",
            ),
            _card(
              primary: Colors.white,
              chipColor: Colors.black,
              backWidget: _decorationContainerB(Color(0xFFFFCE2B), 90, -40),
              chipText1: "Party",
              chipText2: "23/7",
            ),
            _card(
              primary: Colors.white,
              chipColor: Colors.black,
              backWidget: _decorationContainerB(Color(0xFFFFCE2B), 90, -40),
              chipText1: "Party",
              chipText2: "23/7",
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(
      {Color primary = Colors.redAccent,
      String chipText1 = '',
      String chipText2 = '',
      Widget backWidget,
      Color chipColor = Colors.black,
      bool isPrimaryCard = false}) {
    return Container(
        height: isPrimaryCard ? 190 : 180,
        width: isPrimaryCard ? width * .32 : width * .32,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
                color: Colors.grey.withAlpha(120),
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                backWidget,
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: _cardInfo(
                      chipText1, chipText2, Colors.black, chipColor,
                      isPrimaryCard: isPrimaryCard),
                )
              ],
            ),
          ),
        ));
  }

  Widget _cardInfo(String title, String courses, Color textColor, Color primary,
      {bool isPrimaryCard = false}) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10, left: 8),
            width: width * .30,
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isPrimaryCard ? Colors.black : textColor),
            ),
          ),
          SizedBox(height: 5),
          _chip(courses, primary, height: 5, isPrimaryCard: isPrimaryCard)
        ],
      ),
    );
  }

  Widget _chip(String text, Color textColor,
      {double height = 0, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
      ),
    );
  }

  Widget _decorationContainerA(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: primary.withAlpha(255),
          ),
        ),
        _smallContainer(primary, 20, 40),
        Positioned(
          top: 20,
          right: -46,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.black),
        )
      ],
    );
  }

  Widget _decorationContainerB(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -65,
          right: -65,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Color(0xFFFFCE2B),
            child: CircleAvatar(radius: 30, backgroundColor: primary),
          ),
        ),
        Positioned(
            top: 35,
            right: -40,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black,
              child: CircleAvatar(radius: 30, backgroundColor: Colors.white),
            ))
      ],
    );
  }

  Positioned _smallContainer(Color primary, double top, double left,
      {double radius = 10}) {
    return Positioned(
        top: top,
        left: left,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: primary.withAlpha(255),
        ));
  }

  Map<String, double> dataMap = {
    "Income": 10,
    "Expenses": 5,
  };

  // BottomNavigationBarItem _bottomIcons(IconData icon) {
  //   return BottomNavigationBarItem(icon: Icon(icon), title: Text(""));
  // }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          _categoryRow("Finances", Colors.white, Colors.white),
          FinancesPieChart(dataMap: dataMap),
          SizedBox(height: 10),
          _categoryRow("Branches", Colors.white, Colors.white),
          _featuredRowBranches(),
          SizedBox(height: 0),
          _categoryRow("Classes", Colors.white, Colors.white),
          _featuredRowClasses(),
          SizedBox(height: 0),
          _categoryRow("Events", Colors.white, Colors.white),
          _featuredRowEvents(),
        ],
      ),
    )));
  }
}


        // Optional nav bar we can use
        //
        // bottomNavigationBar: BottomNavigationBar(
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   selectedItemColor: Colors.purple,
        //   unselectedItemColor: Colors.grey.shade300,
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: 0,
        //   items: [
        //     _bottomIcons(Icons.home),
        //     _bottomIcons(Icons.star_border),
        //     _bottomIcons(Icons.book),
        //     _bottomIcons(Icons.person),
        //   ],
        // ),

  //  Additionial decorations
  //
  // Widget _decorationContainerC(Color primary, double top, double left) {
  //   return Stack(
  //     children: <Widget>[
  //       Positioned(
  //         top: -105,
  //         left: -35,
  //         child: CircleAvatar(
  //           radius: 70,
  //           backgroundColor: Colors.black.withAlpha(100),
  //         ),
  //       ),
  //       Positioned(
  //           top: 35,
  //           right: -40,
  //           child: ClipRect(
  //               clipper: QuadClipper(),
  //               child:
  //                   CircleAvatar(backgroundColor: Colors.black, radius: 40))),
  //       _smallContainer(
  //         Colors.yellow,
  //         35,
  //         70,
  //       )
  //     ],
  //   );
  // }

  // Widget _decorationContainerD(Color primary, double top, double left,
  //     {Color secondary, Color secondaryAccent}) {
  //   return Stack(
  //     children: <Widget>[
  //       Positioned(
  //         top: top,
  //         left: left,
  //         child: CircleAvatar(
  //           radius: 100,
  //           backgroundColor: secondary,
  //         ),
  //       ),
  //       _smallContainer(Colors.yellow, 18, 35, radius: 12),
  //       Positioned(
  //         top: 130,
  //         left: -50,
  //         child: CircleAvatar(
  //           radius: 80,
  //           backgroundColor: primary,
  //           child: CircleAvatar(radius: 50, backgroundColor: secondaryAccent),
  //         ),
  //       ),
  //       Positioned(
  //         top: -30,
  //         right: -40,
  //         child: _circularContainer(80, Colors.transparent,
  //             borderColor: Colors.white),
  //       )
  //     ],
  //   );
  // }

  // Widget _decorationContainerE(Color primary, double top, double left,
  //     {Color secondary}) {
  //   return Stack(
  //     children: <Widget>[
  //       Positioned(
  //         top: -105,
  //         left: -35,
  //         child: CircleAvatar(
  //           radius: 70,
  //           backgroundColor: primary.withAlpha(100),
  //         ),
  //       ),
  //       Positioned(
  //           top: 40,
  //           right: -25,
  //           child: ClipRect(
  //               clipper: QuadClipper(),
  //               child: CircleAvatar(backgroundColor: primary, radius: 40))),
  //       Positioned(
  //           top: 45,
  //           right: -50,
  //           child: ClipRect(
  //               clipper: QuadClipper(),
  //               child: CircleAvatar(backgroundColor: secondary, radius: 50))),
  //       _smallContainer(Colors.yellow, 15, 90, radius: 5)
  //     ],
  //   );
  // }

  // Widget _decorationContainerF(
  //     Color primary, Color secondary, double top, double left) {
  //   return Stack(
  //     children: <Widget>[
  //       Positioned(
  //           top: 25,
  //           right: -20,
  //           child: RotatedBox(
  //             quarterTurns: 1,
  //             child: ClipRect(
  //                 clipper: QuadClipper(),
  //                 child: CircleAvatar(
  //                     backgroundColor: primary.withAlpha(100), radius: 50)),
  //           )),
  //       Positioned(
  //           top: 34,
  //           right: -8,
  //           child: ClipRect(
  //               clipper: QuadClipper(),
  //               child: CircleAvatar(
  //                   backgroundColor: secondary.withAlpha(100), radius: 40))),
  //       _smallContainer(Colors.yellow, 15, 90, radius: 5)
  //     ],
  //   );
  // }

    // Widget _featuredRowB() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Container(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: <Widget>[
  //           _card(
  //             primary: Color(0xFFFFCE2B),
  //             chipColor: Colors.black,
  //             backWidget: _decorationContainerD(
  //               Color(0xFFFFCE2B),
  //               -100,
  //               -65,
  //               secondary: Colors.black,
  //               secondaryAccent: Color(0xFFFFCE2B),
  //             ),
  //             chipText1: "English for career development ",
  //             chipText2: "8 Cources",
  //             isPrimaryCard: true,
  //           ),
  //           _card(
  //             primary: Colors.white,
  //             chipColor: Colors.purple,
  //             backWidget: _decorationContainerE(
  //               Colors.purple,
  //               90,
  //               -40,
  //               secondary: Color(0xFFFFCE2B),
  //             ),
  //             chipText1: "Bussiness foundation",
  //             chipText2: "8 Cources",
  //           ),
  //           _card(
  //             primary: Colors.white,
  //             chipColor: Colors.black,
  //             backWidget:
  //                 _decorationContainerF(Colors.black, Colors.black, 50, -30),
  //             chipText1: "Excel skill for business",
  //             chipText2: "8 Cources",
  //           ),
  //           _card(
  //             primary: Colors.white,
  //             chipColor: Color(0xFFFFCE2B),
  //             backWidget: _decorationContainerA(
  //               Colors.white,
  //               -50,
  //               30,
  //             ),
  //             chipText1: "Beacame a data analyst",
  //             chipText2: "8 Cources",
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }