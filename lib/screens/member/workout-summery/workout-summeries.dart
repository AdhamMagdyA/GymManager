import 'package:gym_project/core/presentation/res/colors.dart';
import 'package:gym_project/screens/nutritionist/fitness-summary.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';

class WorkoutSummaries extends StatelessWidget {
  WorkoutSummaries({Key key}) : super(key: key);

  final fitSummaries = [
    {'Calories': '153'},
    {'Calories': '286'},
    {'Calories': '555'},
    {'Calories': '555'},
    {'Calories': '555'},
    {'Calories': '555'},
    {'Calories': '555'},
  ];

  final processes = [
    {'name': 'Hello', 'isCompleted': false},
    {'name': 'Hello2', 'isCompleted': true}
  ];

  Widget Exam(BuildContext context) {
    print("dd");
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 80),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xff181818),
            ),
            padding: const EdgeInsets.only(top: 16, left: 5),
            child: Stack(children: [
              SingleChildScrollView(
                child: FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0,
                    color: Colors.white24,
                    indicatorTheme: IndicatorThemeData(
                      position: 0,
                      size: 8.0,
                    ),
                    connectorTheme: ConnectorThemeData(
                      thickness: 2.5,
                    ),
                  ),
                  builder: TimelineTileBuilder.connected(
                    connectionDirection: ConnectionDirection.before,
                    itemCount: fitSummaries.length,
                    contentsBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Week ' + (index + 1).toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            FitnessSummaryWidget(context, fitSummaries[index]),
                          ],
                        ),
                      );
                    },
                    indicatorBuilder: (_, index) {
                      return OutlinedDotIndicator(
                        color: Colors.white24,
                        borderWidth: 2.5,
                      );
                    },
                    connectorBuilder: (_, index, ___) => SolidLineConnector(
                      color: Colors.white24,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
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
                  child: new Text('Workout Summaries',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'sans-serif-light',
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget FitnessSummaryWidget(BuildContext context, dynamic fitSum) {
    return GestureDetector(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          // width: 400,
          // decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Day 1',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            fitSum['Calories'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Day 2',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            fitSum['Calories'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Day 3',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            fitSum['Calories'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Day 4',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            fitSum['Calories'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Day 5',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            fitSum['Calories'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Day 6',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            fitSum['Calories'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Day 7',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            fitSum['Calories'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              )),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Exam(context),
        ),
      ),
    );
  }
}
