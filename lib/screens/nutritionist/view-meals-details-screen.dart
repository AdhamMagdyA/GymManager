import 'package:flutter/material.dart';
import 'package:gym_project/common/my-list-tile-without-trailing.dart';
import 'package:gym_project/widget/grid_view_card.dart';

class MealsDetailsScreen extends StatelessWidget {
  var _meal = {
    'id': 1,
    'title': "Meal 1",
    'nutritionist_id': 5,
    'created_at': "2021-09-14 08:29:15",
    'updated_at': "2021-09-14 08:29:15",
    'items': [
      {
        'id': 1,
        'level': 1,
        'cal': 28.95,
        'title': "Item 1",
        'nutritionist_id': 5,
        'created_at': "2021-09-14 08:29:10",
        'updated_at': "2021-09-14 08:29:10",
      },
      {
        'id': 2,
        'level': 1,
        'cal': 30.8,
        'title': "Item 2",
        'nutritionist_id': 4,
        'created_at': "2021-09-14 08:29:10",
        'updated_at': "2021-09-14 08:29:10",
      },
    ],
  };
  @override
  Widget build(BuildContext context) {
    var items = _meal['items'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  child: Image.network(
                    "https://media.istockphoto.com/photos/kettlebell-and-medicine-ball-in-the-gym-equipment-for-functional-picture-id1153479113?k=20&m=1153479113&s=612x612&w=0&h=wLZnQE2GPjXJFYVpygKlNK5iyD8THMyPOGG4qFGr3xE=",
                    fit: BoxFit.fill,
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                  child: Text(
                    _meal['title'],
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "Items",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                for (Map<String, Object> item in _meal['items'])
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: CustomListTileNoTrailing(
                      item['title'],
                      [
                        '${item['cal']} cal',
                        'level ${item['level']}',
                      ],
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
