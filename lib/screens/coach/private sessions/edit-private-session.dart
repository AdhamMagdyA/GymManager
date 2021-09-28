import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_project/viewmodels/exercise-list-view-model.dart';
import 'package:gym_project/viewmodels/private-session-list-view-model.dart';
import 'package:gym_project/viewmodels/private-session-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

import '../coach-tabs-screen.dart';

class EditPrivateSessionForm extends StatefulWidget {
  final int id;

  EditPrivateSessionForm(this.id);
  @override
  MapScreenState createState() => MapScreenState();
}

//you can change the form heading from line 51,93
//you can change the form fields from lines (119 ,138 , etc ) -> each padding represent a field
//
class MapScreenState extends State<EditPrivateSessionForm>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  PrivateSessionViewModel _privateSession;
  bool status = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  PrivateSessionListViewModel pS;
  bool error = false;
  @override
  void initState() {
    super.initState();
    var token = Provider.of<User>(context, listen: false).token;
    print(token);
    Provider.of<PrivateSessionListViewModel>(context, listen: false)
        .fetchPrivateSession(widget.id)
        .then((value) {
      pS = Provider.of<PrivateSessionListViewModel>(context, listen: false);
      _privateSession = pS.privateSession;
      setState(() {
        titleController = TextEditingController(text: _privateSession.title);
        descriptionController =
            TextEditingController(text: _privateSession.description);
        durationController =
            TextEditingController(text: _privateSession.duration);
        priceController =
            TextEditingController(text: _privateSession.price.toString());
        linkController = TextEditingController(text: _privateSession.link);
      });
    }).catchError((err) {
      error = true;
      print('error occured $err');
    });
  }

  refresh() {
    setState(() {});
  }

  bool savePrivateSession() {
    setState(() {
      Provider.of<PrivateSessionListViewModel>(context, listen: false)
          .editPrivateSession(_privateSession)
          .then((value) {
        showSuccessMessage(context);
      }).catchError((err) {
        showErrorMessage(context);
        print('error occured $err');
      });
    });
    return true;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: new Container(
          color: Color(0xFF181818), //background color
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    height: 100.0,
                    color: Color(0xFF181818), //background color
                    child: new Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 20.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  child: new Icon(
                                    Icons.arrow_back_ios,
                                    color: Color(0xFFFFCE2B),
                                    size: 22.0,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                  //-->header
                                  child: new Text('Edit Private Session',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          fontFamily: 'sans-serif-light',
                                          color: Colors.white)),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  new Container(
                    //height: 1000.0,
                    constraints: new BoxConstraints(minHeight: 500),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),

                    //color: Colors.white,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Padding(
                      //padding: EdgeInsets.only(bottom: 30.0),
                      padding: EdgeInsets.all(30),
                      child: Form(
                        key: _formKey,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          //---> topic
                                          'Private Session Info',
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
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Title',
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
                                    new Flexible(
                                      child: new TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty || value == null) {
                                            return 'Value cannot be empty!';
                                          }
                                          if (value.length > 255) {
                                            return 'Length must not exceed 255 characters!';
                                          }
                                          return null;
                                        },
                                        controller: titleController,
                                        decoration: const InputDecoration(
                                            hintText: "Enter Your Title"),
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Description',
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
                                  new Flexible(
                                    child: new TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty || value == null) {
                                          return 'Value cannot be empty!';
                                        }
                                        return null;
                                      },
                                      controller: descriptionController,
                                      decoration: InputDecoration(
                                        hintText: "Enter Your Description",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Duration',
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
                                  new Flexible(
                                    child: new TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty || value == null) {
                                          return 'Value cannot be empty!';
                                        }
                                        return null;
                                      },
                                      controller: durationController,
                                      decoration: const InputDecoration(
                                          hintText: "Enter duration h:m:s"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Price',
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
                                  new Flexible(
                                    child: new TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty || value == null) {
                                          return 'Value cannot be empty!';
                                        }
                                        if (value.length > 3) {
                                          return 'length must not exceed 3!';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      controller: priceController,
                                      decoration: const InputDecoration(
                                          hintText: "Enter price"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'link',
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
                                    new Flexible(
                                      child: new TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty || value == null) {
                                            return 'Value cannot be empty!';
                                          }
                                          return null;
                                        },
                                        controller: linkController,
                                        decoration: const InputDecoration(
                                            hintText: "Enter link"),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text("Edit"),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  primary: Color(0xFFFFCE2B),
                                  onPrimary: Colors.black,
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  minimumSize: Size(100, 30),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _status = true;
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                  });

                                  if (_formKey.currentState.validate()) {
                                    _privateSession.title =
                                        titleController.text;
                                    _privateSession.description =
                                        descriptionController.text;
                                    _privateSession.duration =
                                        durationController.text;
                                    _privateSession.price =
                                        double.parse(priceController.text);
                                    _privateSession.link = linkController.text;

                                    status = savePrivateSession();

                                    print("Back!");
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
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

  Future<dynamic> showSuccessMessage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'Success!',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Center(
                  child: Text(
                    'Session updated successfully!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.black,
                      fixedSize: Size.fromWidth(150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                create: (_) => ExerciseListViewModel(),
                              ),
                            ],
                            child: CoachTabsScreen(),
                          ),
                        ));
                  },
                  child: Text('Go to homepage'),
                ),
              ],
            ),
          );
        });
  }

  Future<dynamic> showErrorMessage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
                Text(
                  'Failure',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Center(
                  child: Text(
                    'Failed to create private session!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
}
