import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/screens/coach/exercises/exercises_screen.dart';
import 'package:gym_project/services/set-webservice.dart';
import 'package:gym_project/viewmodels/set-list-view-model.dart';
import 'package:gym_project/viewmodels/set-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class EditSetForm extends StatefulWidget {
  final SetViewModel setVM;
  EditSetForm(this.setVM);
  @override
  MapScreenState createState() => MapScreenState();
}

//you can change the form heading from line 51,93
//you can change the form fields from lines (119 ,138 , etc ) -> each padding represent a field
class MapScreenState extends State<EditSetForm>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController breakDurationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    String token = Provider.of<User>(context, listen: false).token;
    Provider.of<SetListViewModel>(context, listen: false)
        .fetchSetDetails(widget.setVM.id, token);
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SetListViewModel setListVM = Provider.of<SetListViewModel>(context);
    SetViewModel setVM = setListVM.set;
    titleController.text = setVM?.title ?? '';
    descriptionController.text = setVM?.description ?? '';
    print('setVM: $setVM');
    if (setVM != null) {
      print('set: ${setVM.set.exercises}');
    }
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
                                  child: new Text('Edit Set',
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
                    child: setListVM.loadingStatus == LoadingStatus.Searching ||
                            setListVM.set == null
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ))
                        : Padding(
                            //padding: EdgeInsets.only(bottom: 30.0),
                            padding: EdgeInsets.all(30),
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
                                        Form(
                                          key: formKey,
                                          child: new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                //---> topic
                                                'Set Information',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                              decoration: const InputDecoration(
                                                  hintText: "Enter Your Title"),
                                                  controller: titleController,
                                            ),
                                          ),
                                        ])),
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
                                            decoration: const InputDecoration(
                                              hintText:
                                                  "Enter Your Description",
                                            ),
                                            controller: descriptionController,
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
                                              'Break Duration',
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
                                            decoration: const InputDecoration(
                                              hintText: "Enter Break Duration",
                                            ),
                                            controller: breakDurationController,
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return 'break duration is required';
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                            if (setVM.exercises.isNotEmpty)
                                  ReorderableListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      for (int index = 0;
                                      index < setVM.exercises.length;
                                          index++)
                                        CustomExerciseListTile(
                                            Key(index.toString()),
                                            setVM.exercises[index],
                                            refresh),
                                    ],
                                    onReorder: (int oldIndex, int newIndex) {
                                      setState(() {
                                        if (oldIndex < newIndex) {
                                          newIndex -= 1;
                                        }
                                    final Exercise exercise = widget
                                            .setVM.exercises
                                            .removeAt(oldIndex);
                                        setVM.exercises
                                            .insert(newIndex, exercise);
                                      });
                                    },
                                  ),
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
                                    onPressed: () async {
                                      setState(() {
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                      });
                                      if (formKey.currentState.validate()) {
                                        await setListVM.putSet(
                                          Set(
                                            id: setVM.id,
                                            title: titleController.text,
                                            description:
                                                descriptionController.text,
                                            breakDuration:
                                                breakDurationController.text,
                                            coachId: setVM.coachId,
                                            exercises: setVM.exercises,
                                          ),
                                          Provider.of<User>(context,
                                                  listen: false)
                                              .token,
                                        );
                                        Navigator.of(context).pop();
                                      }
                                    },
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

class CustomExerciseListTile extends StatefulWidget {
  final Exercise exercise;
  final Key key;
  final Function() notifyParent;

  CustomExerciseListTile(this.key, this.exercise, this.notifyParent)
      : super(key: key);
  @override
  _CustomExerciseListTileState createState() => _CustomExerciseListTileState();
}

class _CustomExerciseListTileState extends State<CustomExerciseListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        key: widget.key,
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: FlutterLogo(),
        ),
        title: Text(
          widget.exercise.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(
            //   widget.exercise['duration'],
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            // ),
            // Text(
            //   '${widget.exercise['cal_burnt']} cal',
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            // )
            Text(
              widget.exercise.coachId.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
        trailing: Column(
          children: [
            // Text(widget.exercise['value'].toString()),
            // SizedBox(height: 4),
            GestureDetector(
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onTap: () {
                // selectedExercises.remove(widget.exercise);
                // print(selectedExercises);
                print('close button clicked');
                widget.notifyParent();
              },
            ),
          ],
        ),
      ),
    );
  }
}
