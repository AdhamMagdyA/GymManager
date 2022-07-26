import 'package:flutter/material.dart';
import 'package:gym_project/screens/nutritionist/plan-edit-form.dart';
import 'package:gym_project/screens/nutritionist/view-plans-details-screen.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class PlansViewScreen extends StatefulWidget {
  bool isSelectionTime = false;

  PlansViewScreen(this.isSelectionTime);
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
    return Scaffold(
      floatingActionButton: Provider.of<User>(context, listen: false).role ==
                  "admin" ||
              Provider.of<User>(context, listen: false).role == "nutritionist"
          ? Container(
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, '/create-plan');
                },
                isExtended: false,
                label: Icon(Icons.add),
              ),
              height: MediaQuery.of(context).size.height * 0.075,
              width: MediaQuery.of(context).size.width * 0.1,
            )
          : Container(),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: EdgeInsetsDirectional.all(10),
          child: Stack(
            children: [
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextFormField(
                    controller: TextEditingController(),
                    cursorColor: Theme.of(context).primaryColor,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                        hintText: 'Search..',
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
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.plans.length,
                        itemBuilder: (ctx, index) {
                          return myListTile(
                              widget.plans[index]['title'],
                              'Description: ' +
                                  widget.plans[index]['description'],
                              'Duration: ' + widget.plans[index]['duration'],
                              index,
                              widget.isSelectionTime);
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
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFFCE2B)),
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
        ),
      ),
    );
  }

  Widget myListTile(String title, String description, String duration,
      int index, bool selectionTime) {
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
          if (!selectionTime) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlansDetailsScreen()));
          } else {
            setState(() {
              PlansViewScreen.whoIsSelected = index;
            });
          }
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
            if (selectionTime)
              TextButton(
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlansDetailsScreen(),
                      ));
                },
              ),
          ],
        ),
        trailing: !selectionTime
            ? Column(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPlanForm()));
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        //the delete should not navigate so I commented the code below

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => EditPlanForm()));
                      },
                      child: Text('Delete',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          )),
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
