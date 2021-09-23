import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';

class ClassesList extends StatefulWidget {
  final String title = 'Yoga';
  final String subtitle1 = '2 Hours';
  final String subtitle2 = '43/60 Member';
  final String subtitle3 = '85 L.E.';
  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {
  final length = 12;

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/create-class');
          },
          isExtended: false,
          label: Icon(Icons.add),
        ),
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: EdgeInsetsDirectional.all(10),
          child: ListView(
            children: [
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
                      child: new Text('Classes List',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: 'sans-serif-light',
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    controller: TextEditingController(),
                    cursorColor: Theme.of(context).primaryColor,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                        hintText: "Search...",
                        suffixIcon: Material(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(Icons.search),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  )),
              SizedBox(height: 20),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/class-details');
                      },
                      child: CustomListTileWithoutCounter(
                          'assets/images/branch.png',
                          widget.title,
                          widget.subtitle1,
                          widget.subtitle2,
                          widget.subtitle3),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
