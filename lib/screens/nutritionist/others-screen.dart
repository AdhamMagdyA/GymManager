import 'package:flutter/material.dart';
import 'package:gym_project/common/crowd-meter.dart';
import 'package:gym_project/screens/coach/exercises/create-exercise.dart';
import 'package:gym_project/screens/coach/exercises/exercises_screen.dart';
import 'package:gym_project/screens/coach/groups/create-group.dart';
import 'package:gym_project/screens/coach/groups/view-groups.dart';
import 'package:gym_project/screens/coach/private%20sessions/create-private-session.dart';
import 'package:gym_project/screens/coach/sets/create-set.dart';
import 'package:gym_project/screens/coach/sets/view-sets.dart';
import 'package:gym_project/screens/nutritionist/item-creation-form.dart';
import 'package:gym_project/screens/nutritionist/meal-creation-from.dart';
import 'package:gym_project/screens/nutritionist/plan-creation-form.dart';
import 'package:gym_project/screens/nutritionist/fitness-summary-creation-form.dart';

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
                                      builder: (context) => CreateItemForm()));
                            },
                            child: Text('Items'),
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
                                      builder: (context) => CreateMealForm()));
                            },
                            child: Text('Meals'),
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
                                      builder: (context) => CreatePlanForm()));
                            },
                            child: Text('Plans'),
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
                                          CreateFitnessSummaryForm()));
                            },
                            child: Text('Fitness Summary'),
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
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ExercisesScreen()));
                            },
                            child: Text('All Items'),
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
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ViewSetsScreen()));
                            },
                            child: Text('All Meals'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Text('Inventory'),
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
