import 'package:gym_project/core/presentation/res/colors.dart';
import 'package:gym_project/screens/nutritionist/fitness-summary.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';

class FitnessSummariesScreen extends StatelessWidget {
  FitnessSummariesScreen({Key key}) : super(key: key);

  final fitSummaries = [
    {'Calories': '153', 'BMI': '23', 'SMM': '49', 'Protein': '22'},
    {'Calories': '286', 'BMI': '46', 'SMM': '12', 'Protein': '49'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63', 'Protein': '13'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63', 'Protein': '22'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63', 'Protein': '22'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63', 'Protein': '22'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63', 'Protein': '22'},
  ];

  final processes = [
    {'name': 'Hello', 'isCompleted': false},
    {'name': 'Hello2', 'isCompleted': true}
  ];

  Widget Exam(BuildContext context) {
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
                              'August 2' + index.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
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
                  child: new Text('Fitness Summaries',
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
      onTapUp: (TapUpDetails tapUpDetails) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FitnessSummaryScreen()));
      },
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '9:41',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              SizedBox(height: 5),
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Calories',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text(
                            fitSum['Calories'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.white24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('BMI',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text(
                            fitSum['BMI'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.white24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('SMM',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text(
                            fitSum['SMM'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.white24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Protein',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            fitSum['Protein'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
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
        body: SafeArea(
          child: Center(
            child: Exam(context),
          ),
        ),
      ),
    );
  }
}
