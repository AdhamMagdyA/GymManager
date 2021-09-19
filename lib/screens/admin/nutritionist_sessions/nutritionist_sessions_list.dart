import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';

class NutritionistSessionsList extends StatefulWidget {
  final String title = 'Keto Diet Session';
  final String subtitle1 = 'Nutritionist: mohamed';
  final String subtitle2 = '12Dec, 2020';
  final String subtitle3 = '60 L.E.';

  @override
  _NutritionistSessionsListState createState() =>
      _NutritionistSessionsListState();
}

class _NutritionistSessionsListState extends State<NutritionistSessionsList> {
  final length = 12;

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/create-nutritionist-session');
          },
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
                    child: new Text('Nutritionist Sessions List',
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
                  return NutritionistSessionTile(
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

class NutritionistSessionTile extends StatefulWidget {
  final String path;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;

  NutritionistSessionTile(
      this.path, this.title, this.subtitle1, this.subtitle2, this.subtitle3);

  @override
  _NutritionistSessionTileState createState() =>
      _NutritionistSessionTileState();
}

class _NutritionistSessionTileState extends State<NutritionistSessionTile> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: Image.asset(widget.path),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.subtitle1,
                  style: TextStyle(color: Colors.white60),
                ),
                Text(
                  widget.subtitle2,
                  style: TextStyle(color: Colors.white60),
                ),
                Text(
                  widget.subtitle3,
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-nutritionist-session');
                },
                child: Text('Edit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
