import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';
import 'package:gym_project/common/only_title_card.dart';

class Others extends StatefulWidget {
  Others();

  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  final titles = [
    "Classes",
    "Equipment",
    "NutritionistSessions",
    "Memberships",
    "Private sessions",
    "Exercise Groups",
    "Diet Plans",
    "Q&A",
    "Supplments",
    "Invitations",
    "Events",
  ];
  final paths = [
    "/class-list",
    "/equipment-list",
    "/nutritionist-session-list",
    "/memberships-list",
    "/sessions/requests",
    "/groups",
    "/plans",
    "/questions",
    "/supplements",
    "/invitations",
    "/events",
  ];
  final imgPaths = [
    "assets/images/class-others.jpg",
    "assets/images/others-supplements.png",
    "assets/images/session.jpg",
    "assets/images/membership-others.jpg",
    "assets/images/session.jpg",
    "assets/images/others-inventory.png",
    "assets/images/others-plans.jpg",
    "assets/images/others-questions.png",
    "assets/images/others-supplements.png",
    "assets/images/others-invite.jpg",
    "assets/images/others-schedule.png",
  ];
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        for (int i = 0; i < paths.length; i++)
          othersTile(imgPaths[i], paths[i], titles[i]),
      ],
    );
  }

  Container othersTile(String imgPath, String destination, String txt) {
    return Container(
      decoration: new BoxDecoration(
        // color: const Color(0xff181818),
        image: new DecorationImage(
          image: AssetImage(imgPath),
          colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, destination);
        },
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}

/**
 * Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsetsDirectional.all(10),
        child: ListView(
          children: [
            SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: title.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, paths[index]);
                      },
                      child: OnlyTitleCard(title[index]));
                }),
          ],
        ),
      ),
    );
 */