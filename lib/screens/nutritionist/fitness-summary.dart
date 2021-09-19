import 'package:flutter/material.dart';
import 'package:gym_project/core/presentation/res/assets.dart';

class FitnessSummaryScreen extends StatelessWidget {
  FitnessSummaryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              )),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: myGridView(context),
      ),
    );
  }

  Widget myGridView(context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          width: double.infinity,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 35, top: 50),
                  child: Text('Fitness \nSummary',
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: GridView.count(
                    padding: const EdgeInsets.all(26.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    children: [
                      GridViewCard(
                          Icons.water, 'Weight', 'Range: 0 - 250', 'Value: 80'),
                      GridViewCard(
                          Icons.water, 'SMM', 'Range: 0 - 100', 'Value: 24'),
                      GridViewCard(
                          Icons.water, 'BMM', 'Range: 0 - 100', 'Value: 10'),
                      GridViewCard(Icons.water, 'Muscle Ratio',
                          'Range: 0 - 100', 'Value: 45'),
                      GridViewCard(Icons.water, 'Height', 'Range: 0 - 250',
                          'Value: 176'),
                      GridViewCard(Icons.water, 'Fat Ratio', 'Range: 0 - 100',
                          'Value: 30'),
                      GridViewCard(Icons.water, 'Protein', 'Range: 0 - 100',
                          'Value: 68'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 230, bottom: 20),
          width: 220,
          height: 190,
          decoration: BoxDecoration(
            color: Color(0xFFFFCE2B),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(190),
                bottomLeft: Radius.circular(290),
                bottomRight: Radius.circular(160),
                topRight: Radius.circular(0)),
          ),
        ),
      ]),
    ));
  }

  Widget GridViewCard(image, title, subTitle1, subTitle2) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0,
          ),
        ],
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(image),
            SizedBox(
              height: 5,
            ),
            Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                )),
            Text(subTitle1,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black,
                )),
            Text(subTitle2,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
