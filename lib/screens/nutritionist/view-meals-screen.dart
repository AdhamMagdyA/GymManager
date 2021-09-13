import 'package:flutter/material.dart';

class MealsViewScreen extends StatefulWidget {
  @override
  _MealsViewScreenState createState() => _MealsViewScreenState();

  static int whoIsSelected = -1;

  final List<dynamic> meals = [
    {
      'title': 'Chicken wings',
      'description': 'Two pieces of tasty chicken wings!',
      'calories': '423'
    },
    {
      'title': 'Steak',
      'description': 'A very elegant piece of steak!',
      'calories': '9000'
    }
  ];
}

class _MealsViewScreenState extends State<MealsViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsetsDirectional.all(10),
      child: Column(
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
              itemCount: widget.meals.length,
              itemBuilder: (ctx, index) {
                return myListTile(
                    widget.meals[index]['title'],
                    'Description: ' + widget.meals[index]['description'],
                    'Calories: ' + widget.meals[index]['calories'],
                    index);
              }),
        ],
      ),
    );
  }

  Widget myListTile(
      String title, String description, String calories, int index) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: MealsViewScreen.whoIsSelected == index
            ? Colors.white24
            : Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            MealsViewScreen.whoIsSelected = index;
          });
        },
        selected: MealsViewScreen.whoIsSelected == index,
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: Icon(Icons.food_bank),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description,
              style: TextStyle(color: Colors.white24),
            ),
            Text(
              calories,
              style: TextStyle(color: Colors.white24),
            ),
          ],
        ),
      ),
    );
  }
}