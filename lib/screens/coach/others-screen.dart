import 'package:flutter/material.dart';
import 'package:gym_project/common/crowd-meter.dart';
import 'package:gym_project/screens/coach/exercises/create-exercise.dart';
import 'package:gym_project/screens/coach/exercises/exercises_screen.dart';
import 'package:gym_project/screens/coach/groups/create-group.dart';
import 'package:gym_project/screens/coach/groups/view-groups.dart';
import 'package:gym_project/screens/coach/private%20sessions/create-private-session.dart';
import 'package:gym_project/screens/coach/sets/create-set.dart';
import 'package:gym_project/screens/coach/sets/view-sets.dart';

class OthersScreen extends StatelessWidget {
  const OthersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        Container(
          decoration: new BoxDecoration(
            // color: const Color(0xff181818),
            image: new DecorationImage(
              image: AssetImage('assets/images/others-create.png'),
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TextButton(
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                onPrimary: Colors.black,
                                fixedSize: Size.fromWidth(150),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateExerciseForm()));
                            },
                            child: Text('Exercise'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              onPrimary: Colors.black,
                              fixedSize: Size.fromWidth(150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateSetForm()));
                            },
                            child: Text('Set'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                onPrimary: Colors.black,
                                fixedSize: Size.fromWidth(150),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateGroupForm()));
                            },
                            child: Text('Group'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                onPrimary: Colors.black,
                                fixedSize: Size.fromWidth(150),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                )),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             CreateGroupForm()));
                            },
                            child: Text('Class'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                onPrimary: Colors.black,
                                fixedSize: Size.fromWidth(150),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreatePrivateSessionForm()));
                            },
                            child: Text('Private Session'),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Center(
              child: Text(
                'Create',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            // color: const Color(0xff181818),
            image: new DecorationImage(
              image: AssetImage('assets/images/others-inventory.png'),
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TextButton(
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                onPrimary: Colors.black,
                                fixedSize: Size.fromWidth(150),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ExercisesScreen(false)));
                            },
                            child: Text('All Exercises'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              onPrimary: Colors.black,
                              fixedSize: Size.fromWidth(150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ViewSetsScreen(false)));
                            },
                            child: Text('All Sets'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                onPrimary: Colors.black,
                                fixedSize: Size.fromWidth(150),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ViewGroupsScreen(false)));
                            },
                            child: Text('All Groups'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Center(
              child: Text(
                'Inventory',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            // color: const Color(0xff181818),
            image: new DecorationImage(
              image: AssetImage('assets/images/others-crowdmeter.png'),
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TextButton(
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CrowdMeter(checkedInMembers: 40, totalMembers: 100),
                        ],
                      ),
                    );
                  });
            },
            child: Center(
              child: Text(
                'Crowd Meter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            // color: const Color(0xff181818),
            image: new DecorationImage(
              image: AssetImage('assets/images/others-announcements.png'),
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                'Announcements',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            // color: const Color(0xff181818),
            image: new DecorationImage(
              image: AssetImage('assets/images/others-questions.png'),
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                'Q&A',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            // color: const Color(0xff181818),
            image: new DecorationImage(
              image: AssetImage('assets/images/others-supplements.png'),
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                'Supplements',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            // color: const Color(0xff181818),
            image: new DecorationImage(
              image: AssetImage('assets/images/others-events.png'),
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                'Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            // color: const Color(0xff181818),
            image: new DecorationImage(
              image: AssetImage('assets/images/others-branches.png'),
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                'Branches',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
