import 'package:flutter/material.dart';
import 'package:gym_project/core/presentation/res/assets.dart';
import 'package:gym_project/widget/grid_view_card.dart';

class EquipmentList extends StatefulWidget {
  const EquipmentList({Key key}) : super(key: key);

  @override
  _EquipmentListState createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, '/create-equipment');
            },
            isExtended: false,
            label: Icon(Icons.add),
          ),
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              //search bar
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.black,
                ),
                width: double.infinity,
              ),

              //background design
              new Align(
                alignment: const Alignment(1.0, -1.0),
                child: Container(
                  //  margin: EdgeInsets.only(left: 230, bottom: 20),
                  width: 170,
                  height: 190,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFCE2B),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(190),
                          bottomLeft: Radius.circular(290),
                          bottomRight: Radius.circular(160),
                          topRight: Radius.circular(0))),
                ),
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
                          Container(
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
                                  child: new Text('Equipment List',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          fontFamily: 'sans-serif-light',
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextField(
                              controller: TextEditingController(),
                              cursorColor: Theme.of(context).primaryColor,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              decoration: InputDecoration(
                                  hintText: "Search...",
                                  suffixIcon: Material(
                                    elevation: 2.0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    child: Icon(Icons.search),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 13)),
                            ),
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
                          '',
                          '',
                          '',
                          '',
                        ),
                        GridViewCard(
                          treadmill,
                          'Treadmill',
                          '',
                          '',
                          '',
                          '',
                        ),
                        GridViewCard(
                          dumbbell,
                          'Dumbbell',
                          '',
                          '',
                          '',
                          '',
                        ),
                        GridViewCard(
                          treadmill,
                          'Treadmill',
                          '',
                          '',
                          '',
                          '',
                        ),
                        GridViewCard(
                          dumbbell,
                          'Dumbbell',
                          '',
                          '',
                          '',
                          '',
                        ),
                        GridViewCard(
                          treadmill,
                          'Treadmill',
                          '',
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
