import 'package:gym_project/component/timeline.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';

class FitnessSummariesScreen extends StatelessWidget {
  FitnessSummariesScreen({Key key}) : super(key: key);

  final processes = [
    {'name': 'Hello', 'isCompleted': false},
    {'name': 'Hello2', 'isCompleted': true}
  ];

  @override
  Widget Exam(BuildContext context) {
    return FixedTimeline.tileBuilder(
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
        itemCount: processes.length,
        contentsBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'August 28',
                ),
                FitnessSummaryWidget(context),
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
    );
  }

  Widget FitnessSummaryWidget(BuildContext context) {
    return Card(
      child: Container(
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
                        Text('450'),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('BMM'),
                        Text('20'),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('SMM'),
                        Text('32'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
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
        body: Center(
          child: Exam(context),
        ),
      ),
    );
  }
}
