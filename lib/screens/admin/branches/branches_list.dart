import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';


class BranchesList extends StatefulWidget {
  final String title = 'Elmaadi';
  final String subtitle1 = '';
  final String subtitle2 = '0101111002';
  final String subtitle3 = '';

  BranchesList();

  @override
  _BranchesListState createState() => _BranchesListState();
}

class _BranchesListState extends State<BranchesList> {
  final length = 12;

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                itemCount: length,
                itemBuilder: (ctx, index) {
                  return CustomListTileWithoutCounter('assets/images/branch.png',widget.title, widget.subtitle1,
                      widget.subtitle2, widget.subtitle3);
                }),
          ],
        ),
      ),
    );
  }
}