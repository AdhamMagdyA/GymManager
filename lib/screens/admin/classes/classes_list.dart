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
          onPressed: () {},
          isExtended: false,
          label: Icon(Icons.add),
        ),
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Container(
        color: Colors.black,
        padding: EdgeInsetsDirectional.all(10),
        child: ListView(
          children: [
            Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: TextEditingController(text: 'Search...'),
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
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
                  return CustomListTileWithoutCounter(
                      'assets/images/branch.png',
                      widget.title,
                      widget.subtitle1,
                      widget.subtitle2,
                      widget.subtitle3);
                }),
          ],
        ),
      ),
    );
  }
}
