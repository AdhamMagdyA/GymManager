import 'package:flutter/material.dart';
import 'package:gym_project/common/my-list-tile-without-trailing.dart';
import 'package:gym_project/widget/grid_view_card.dart';

class ItemsDetailsScreen extends StatelessWidget {
  final _item = {
    'id': 1,
    'level': 'red',
    'calories': 28.95,
    'title': "Carrot",
    'image': 'https://www.owimio.com/wp-content/uploads/2021/02/carrot.jpg',
    'nutritionist': 'Amr Fatouh',
  };

  Color mapLevelToColor(String level) {
    if (level == 'red') {
      return Colors.red.shade800;
    } else if (level == 'yellow') {
      return Colors.yellow.shade700;
    } else if (level == 'green') {
      return Colors.green.shade800;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
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
                    _item['image'],
                    fit: BoxFit.cover,
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _item['title'],
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Calories: ${_item['calories']}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                            text: 'Level: ',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            children: [
                              TextSpan(
                                text: '${_item['level']}',
                                style: TextStyle(
                                  color: mapLevelToColor(_item['level']),
                                ),
                              )
                            ]),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Created By: ${_item['nutritionist']}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
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
