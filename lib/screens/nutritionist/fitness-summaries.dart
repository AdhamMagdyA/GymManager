import 'package:gym_project/core/presentation/res/colors.dart';
import 'package:gym_project/screens/nutritionist/fitness-summary.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';

class FitnessSummariesScreen extends StatelessWidget {
  FitnessSummariesScreen({Key key}) : super(key: key);

  final fitSummaries = [
    {'Calories': '153', 'BMI': '23', 'SMM': '49'},
    {'Calories': '286', 'BMI': '46', 'SMM': '12'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63'},
    {'Calories': '555', 'BMI': '17', 'SMM': '63'},
  ];

  final processes = [
    {'name': 'Hello', 'isCompleted': false},
    {'name': 'Hello2', 'isCompleted': true}
  ];

  Widget Exam(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(right: 100, bottom: 200),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
        ),
        Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(left: 100, top: 200),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.only(top: 16, left: 5),
            child: SingleChildScrollView(
              child: FixedTimeline.tileBuilder(
                theme: TimelineThemeData(
                  nodePosition: 0,
                  color: Color(0xff989898),
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
                          ),
                          FitnessSummaryWidget(context, fitSummaries[index]),
                        ],
                      ),
                    );
                  },
                  indicatorBuilder: (_, index) {
                    return OutlinedDotIndicator(
                      color: Colors.black12,
                      borderWidth: 2.5,
                    );
                  },
                  connectorBuilder: (_, index, ___) => SolidLineConnector(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
          ),
        ),
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
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                  Text('9:41'),
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
                          Text('Calories'),
                          Text(
                            fitSum['Calories'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('BMI'),
                          Text(
                            fitSum['BMI'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('SMM'),
                          Text(
                            fitSum['SMM'],
                            style: TextStyle(fontWeight: FontWeight.bold),
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
