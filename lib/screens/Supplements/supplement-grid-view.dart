import 'package:flutter/material.dart';
import 'package:gym_project/core/presentation/res/assets.dart';
import 'package:gym_project/widget/grid_view_card.dart';

class SupplementList extends StatefulWidget {
  const SupplementList({ Key key }) : super(key: key);

  @override
  _SupplementListState createState() => _SupplementListState();
}

class _SupplementListState extends State<SupplementList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          //background design
          Container(
            margin: EdgeInsets.only(left: 230, bottom: 20),
            width: 220,
            height: 190,
            decoration: BoxDecoration(
                color: Color(0xFFFFCE2B),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(250),
                    bottomLeft: Radius.circular(290),
                    bottomRight: Radius.circular(160),
                    topRight: Radius.circular(0))),
          ),
          //grid
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Supplements",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(26.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: <Widget>[
                    GridViewCard(
                      dumbbell,
                      'Dumbbell',
                      '1000 \$',
                      '',
                      '',
                      '',
                    ),
                    GridViewCard(
                      dumbbell,
                      'Dumbbell',
                      '1000 \$',
                      '',
                      '',
                      '',
                    ),
                    GridViewCard(
                      dumbbell,
                      'Dumbbell',
                      '1000 \$',
                      '',
                      '',
                      '',
                    ),
                    GridViewCard(
                      dumbbell,
                      'Dumbbell',
                      '1000 \$',
                      '',
                      '',
                      '',
                    ),
                    GridViewCard(
                      dumbbell,
                      'Dumbbell',
                      '1000 \$',
                      '',
                      '',
                      '',
                    ),
                    GridViewCard(
                      dumbbell,
                      'Dumbbell',
                      '1000 \$',
                      '',
                      '',
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}