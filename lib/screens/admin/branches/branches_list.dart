import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

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
      appBar: Provider.of<User>(context).role != "admin"
          ? AppBar(
              title: Text(
                'Branches',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xff181818),
              iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
            )
          : PreferredSize(child: Container(), preferredSize: Size(0, 0)),
      floatingActionButton:
          Provider.of<User>(context, listen: false).role == "admin"
              ? Container(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/create-branch');
                    },
                    isExtended: false,
                    label: Icon(Icons.add),
                  ),
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.1,
                )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: EdgeInsetsDirectional.all(10),
          child: ListView(
            children: [
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
                        Navigator.pushNamed(context, '/branch-details');
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
