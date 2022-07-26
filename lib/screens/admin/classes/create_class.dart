import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_project/screens/admin/helping-widgets/create-form-widgets.dart';

class CreateClassForm extends StatefulWidget {
  const CreateClassForm({Key key}) : super(key: key);

  @override
  _CreateClassFormState createState() => _CreateClassFormState();
}

class _CreateClassFormState extends State<CreateClassForm>
    with SingleTickerProviderStateMixin {
  bool _status = false;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    _selectDate(BuildContext context) async {
      final DateTime selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
      );
      if (selected != null && selected != selectedDate)
        setState(() {
          selectedDate = selected;
          _status = true;
        });
    }

    return new Scaffold(
      body: SafeArea(
        child: new Container(
          color: Color(0xFF181818), //background color
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  //header
                  new Container(
                    height: 100.0,
                    color: Color(0xFF181818), //background color
                    child: new Column(
                      children: <Widget>[
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
                                child: new Text('Create Class',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        fontFamily:
                                            'assets/fonts/Changa-Bold.ttf',
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //form
                  new Container(
                    constraints: new BoxConstraints(minHeight: 500),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //Form header
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      //---> topic
                                      'Class Information',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[],
                                )
                              ],
                            ),
                          ),
                          //Form fields
                          field('Title', 'Enter the class title'),
                          field('Description', 'Enter the class description'),
                          field('Capacity', 'Enter the class a capacity'),
                          field('Price', 'Enter the class price'),
                          field('Duration', 'Enter the class duration'),
                          field('Link', 'Enter the class link if online'),
                          field('level', 'Enter the class level'),
                          //date picker
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Date ',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                    color: Color(0xFFFFCE2B),
                                    child: Text("Choose Date"),
                                    //focusNode: !_status,
                                  ),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: _status
                                ? Text(
                                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                    style: TextStyle(color: Colors.black),
                                  )
                                : SizedBox(),
                          ),
                          //submit button
                          Padding(
                            padding: EdgeInsets.only(
                                left: 95.0, bottom: 0, right: 95.0, top: 50.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Container(
                                        child: new ElevatedButton(
                                      child: new Text("Create"),
                                      style: ElevatedButton.styleFrom(
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          primary: Color(0xFFFFCE2B),
                                          onPrimary: Colors.black,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      onPressed: () {
                                        setState(() {
                                          _status = true;
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                        });
                                      },
                                    )),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
}
