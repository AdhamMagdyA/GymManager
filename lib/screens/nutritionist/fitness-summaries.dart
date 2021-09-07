import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';

class FitnessSummariesScreen extends StatelessWidget {
  FitnessSummariesScreen({Key key}) : super(key: key);

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
              children: [
                Text('9:41'),
              ],
            ),
            SizedBox(height: 5),
            Row(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('BMM'),
                      Text('20'),
                    ],
                  ),
                ),
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
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Here');
    return Theme(
      data: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              )),
      child: Scaffold(
        body: FitnessSummaryWidget(context),
      ),
    );
  }
}
