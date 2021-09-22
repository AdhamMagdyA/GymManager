import 'package:flutter/material.dart';

class PlanSchedule extends StatelessWidget {
  final _plan = {
    'id': 3,
    'description':
        "Numquam consequatur doloribus dolores impedit aut. Corrupti dolores et ut debitis. Unde doloremque quos ullam fuga. Et et soluta hic error quae esse qui.",
    'title': "Keto",
    'nutritionist_id': 3,
    'created_at': "2021-09-14 08:29:18",
    'updated_at': "2021-09-14 08:29:18",
    'dinner': [
      {
        'id': 2,
        'title': "Chicken Fillet",
        'nutritionist_id': 3,
        'description': 'Two tinder pieces of chicken fillet',
        'type': 'Breakfast',
        'created_at': "2021-09-14 08:29:15",
        'updated_at': "2021-09-14 08:29:15",
      },
      {
        'id': 2,
        'title': "Greek Salad",
        'nutritionist_id': 6,
        'description': 'Just the normal greek salad you would get!',
        'type': 'Dinner',
        'created_at': "2021-09-14 08:29:15",
        'updated_at': "2021-09-14 08:29:15",
      },
    ],
    'breakfast': [
      {
        'id': 1,
        'level': 1,
        'cal': 28.95,
        'title': "Eggs",
        'nutritionist_id': 5,
        'description': 'Two boiled eggs',
        'type': 'Lunch',
        'created_at': "2021-09-14 08:29:10",
        'updated_at': "2021-09-14 08:29:10",
      },
      {
        'id': 2,
        'level': 1,
        'cal': 30.8,
        'title': "Mashed Potatoes",
        'nutritionist_id': 4,
        'description': 'A big potato mashed into small pieces with salt',
        'type': 'Snack',
        'created_at': "2021-09-14 08:29:10",
        'updated_at': "2021-09-14 08:29:10",
      },
    ],
    'lunch': [
      {
        'id': 1,
        'level': 1,
        'cal': 28.95,
        'title': "Steak",
        'nutritionist_id': 5,
        'description': 'Kobe beaf steak, very expensive indeed',
        'type': 'Lunch',
        'created_at': "2021-09-14 08:29:10",
        'updated_at': "2021-09-14 08:29:10",
      },
      {
        'id': 2,
        'level': 1,
        'cal': 30.8,
        'title': "Fried Shrimp",
        'nutritionist_id': 4,
        'description': 'Fried shrimp, 400 grams only!',
        'type': 'Snack',
        'created_at': "2021-09-14 08:29:10",
        'updated_at': "2021-09-14 08:29:10",
      },
    ],
    'snack': [
      {
        'id': 1,
        'level': 1,
        'cal': 28.95,
        'title': "Apple",
        'nutritionist_id': 5,
        'description': 'Just one apple',
        'type': 'Lunch',
        'created_at': "2021-09-14 08:29:10",
        'updated_at': "2021-09-14 08:29:10",
      },
      {
        'id': 2,
        'level': 1,
        'cal': 30.8,
        'title': "Pineapple",
        'nutritionist_id': 4,
        'description': 'Very tasty fruit',
        'type': 'Snack',
        'created_at': "2021-09-14 08:29:10",
        'updated_at': "2021-09-14 08:29:10",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                child: Image.network(
                  "https://media.istockphoto.com/photos/arabic-and-middle-eastern-dinner-table-hummus-tabbouleh-salad-salad-picture-id1175505781",
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
                  _plan['title'],
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  _plan['description'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 15.0,
                    fontFamily: 'assets/fonts/ProximaNova-Regular.otf',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Breakfast",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                  ),
                ),
              ),
              for (Map<String, Object> meal in _plan['breakfast'])
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: CustomListTileNoTrailing(
                    meal['title'],
                    [meal['description']],
                  ),
                ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Lunch",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                  ),
                ),
              ),
              for (Map<String, Object> meal in _plan['lunch'])
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: CustomListTileNoTrailing(
                    meal['title'],
                    [meal['description']],
                  ),
                ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Dinner",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                  ),
                ),
              ),
              for (Map<String, Object> meal in _plan['dinner'])
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: CustomListTileNoTrailing(
                    meal['title'],
                    [meal['description']],
                  ),
                ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Snack",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'assets/fonts/Changa-Bold.ttf',
                  ),
                ),
              ),
              for (Map<String, Object> meal in _plan['snack'])
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: CustomListTileNoTrailing(
                    meal['title'],
                    [meal['description']],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomListTileNoTrailing extends StatefulWidget {
  final String title;
  final List<String> subtitles;

  CustomListTileNoTrailing(this.title, this.subtitles);
  @override
  _CustomListTileNoTrailingState createState() =>
      _CustomListTileNoTrailingState();
}

class _CustomListTileNoTrailingState extends State<CustomListTileNoTrailing> {
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
          child: Icon(Icons.food_bank),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (String subtitle in widget.subtitles)
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white54,
                ),
              )
          ],
        ),
      ),
    );
  }
}
