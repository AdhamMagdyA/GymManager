import 'package:flutter/material.dart';
import 'package:gym_project/screens/coach/exercises/create-exercise.dart';
import 'package:gym_project/screens/coach/groups/create-group.dart';
import 'package:gym_project/screens/coach/private%20sessions/create-private-session.dart';
import 'package:gym_project/screens/coach/sets/create-set.dart';

class OthersScreen extends StatelessWidget {
  const OthersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
                            child: Text('Exercises'),
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
                            child: Text('Sets'),
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
                            child: Text('Groups'),
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
                            child: Text('Classes'),
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
                            child: Text('Private Sessions'),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Text('Create'),
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
            onPressed: () {},
            child: Text('Crowd Meter'),
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
            onPressed: () {},
            child: Text('Announcements'),
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
            onPressed: () {},
            child: Text('Q&A'),
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
            onPressed: () {},
            child: Text('Supplements'),
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
            onPressed: () {},
            child: Text('Events'),
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
            onPressed: () {},
            child: Text('Branches'),
          ),
        ],
      ),
    );
  }
}
