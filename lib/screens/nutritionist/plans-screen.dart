import 'package:flutter/material.dart';

class PlansViewScreen extends StatefulWidget {
  @override
  _PlansViewScreenState createState() => _PlansViewScreenState();

  static int whoIsSelected = -1;

  final List<dynamic> plans = [
    {
      'title': 'Five Every Five',
      'description': 'You lose five Kgs every five weeks!',
      'duration': '5 weeks'
    },
    {
      'title': 'Keto',
      'description': 'Just your normal Keto diet, simple right?',
      'duration': '6 months'
    },
    {
      'title': 'No Carbos',
      'description': 'Eat whatever you want, just no carbohydrates :D',
      'duration': '1 year'
    },
    {
      'title': 'Very Nice Diet Plan',
      'description': 'you eat less carbos and eat more protein, simple?',
      'duration': '2 years'
    },
    {
      'title': 'No Carbos V2',
      'description': 'Eat whatever you want, just no carbohydrates :D',
      'duration': '3 months'
    },
    {
      'title': 'Very Nice Diet Plan V2',
      'description': 'you eat less carbos and eat more protein, simple?',
      'duration': '5 months'
    },
    {
      'title': 'No Carbos',
      'description': 'Eat whatever you want, just no carbohydrates :D',
      'duration': '8 months'
    }
  ];
}

class _PlansViewScreenState extends State<PlansViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsetsDirectional.all(10),
      child: Stack(
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
          Container(
            margin: EdgeInsets.only(top: 80),
            child: ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.plans.length,
                    itemBuilder: (ctx, index) {
                      return myListTile(
                          widget.plans[index]['title'],
                          'Description: ' + widget.plans[index]['description'],
                          'Duration: ' + widget.plans[index]['duration'],
                          index);
                    }),
              ],
            ),
          ),
          if (PlansViewScreen.whoIsSelected != -1)
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFFFFCE2B)),
                      child: Text('Submit'),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFFCE2B), elevation: 10),
                      child: Text('Cancel'),
                      onPressed: () {
                        setState(() {
                          PlansViewScreen.whoIsSelected = -1;
                        });
                      },
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget myListTile(
      String title, String description, String duration, int index) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: PlansViewScreen.whoIsSelected == index
            ? Colors.white24
            : Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            PlansViewScreen.whoIsSelected = index;
          });
        },
        selected: PlansViewScreen.whoIsSelected == index,
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: Icon(Icons.note),
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
              duration,
              style: TextStyle(color: Colors.white24),
            ),
          ],
        ),
      ),
    );
  }
}
