import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:gym_project/screens/coach/sets/view-sets.dart';
import 'package:gym_project/viewmodels/exercise-list-view-model.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';
import 'package:gym_project/viewmodels/set-list-view-model.dart';
import 'package:gym_project/viewmodels/set-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:gym_project/models/set.dart';

import '../coach-tabs-screen.dart';
import '../exercises/exercises_screen.dart';

Map<int, Map<String, Object>> selectedExercises = {};
List<ExerciseViewModel> orderedExercises = [];

class CreateSetForm extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

//you can change the form heading from line 51,93
//you can change the form fields from lines (119 ,138 , etc ) -> each padding represent a field
class MapScreenState extends State<CreateSetForm>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  Set _set;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController breakDurationController = TextEditingController();

  bool status = false;

  SetListViewModel setListViewModel;
  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    if (status) {
      setListViewModel = Provider.of<SetListViewModel>(context);
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    setTextFormFieldsInitialValues();

    if (status == true) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        if (setListViewModel.set != null)
          showSuccessMessage(context);
        else
          showErrorMessage(context);
      });
    }
  }

  void setTextFormFieldsInitialValues() {
    Map<String, String> initialValues = {
      'title': 'Flutter Set 1',
      'description': 'Description of flutter set 1',
      'break_duration': '00:30'
    };
    titleController.text = initialValues['title'];
    descriptionController.text = initialValues['description'];
    breakDurationController.text = initialValues['break_duration'];
  }

  bool saveSet() {
    setState(() {
      String token = Provider.of<User>(context, listen: false).token;
      Provider.of<SetListViewModel>(context, listen: false)
          .postSet(_set, token);
    });
    return true;
  }

  refresh() {
    setState(() {});
  }

  Widget buildCreateButton() {
    return Padding(
      padding: EdgeInsets.only(left: 95.0, bottom: 0, right: 95.0, top: 50.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 0),
              child: Container(
                  child: new ElevatedButton(
                child: new Text("Create"),
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  primary: Color(0xFFFFCE2B),
                  onPrimary: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });

                  if (_formKey.currentState.validate() &&
                      selectedExercises.isNotEmpty) {
                    _set = new Set(
                      title: titleController.text,
                      description: descriptionController.text,
                      breakDuration: breakDurationController.text,
                      exercises:
                          orderedExercises.map((e) => e.exercise).toList(),
                    );

                    status = saveSet();

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ViewSetsScreen(false),
                      ),
                    );
                  }
                },
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget buildReorderableList() {
    return ReorderableListView(
      shrinkWrap: true,
      children: <Widget>[
        for (int index = 0; index < orderedExercises.length; index++)
          CustomExerciseListTile(
              Key(index.toString()), orderedExercises[index], refresh),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final ExerciseViewModel item = orderedExercises.removeAt(oldIndex);
          orderedExercises.insert(newIndex, item);
        });
      },
    );
  }

  Widget buildChooseExercisesButton() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Flexible(
            child: Center(
                child: ElevatedButton(
              child: Text('Choose Exercises'),
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black,
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              onPressed: () async {
                var result = await Navigator.pushNamed(
                  context,
                  ExercisesScreen.routeName,
                  arguments: selectedExercises,
                ) as Map<int, Map<String, Object>>;
                if (result != null && result.isNotEmpty) {
                  setState(() {
                    selectedExercises = result;
                    orderedExercises.clear();
                    selectedExercises.values
                        .forEach((Map<String, Object> exerciseData) {
                      int quantity = exerciseData['quantity'] as int;
                      ExerciseViewModel exercise =
                          exerciseData['exercise'] as ExerciseViewModel;
                      for (int i = 0; i < quantity; i++) {
                        orderedExercises.add(exercise);
                      }
                    });
                  });
                }
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget buildTextFormFieldLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextFormField({
    String hintText,
    TextEditingController controller,
    String Function(String) validator,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Flexible(
            child: new TextFormField(
                decoration: InputDecoration(
                  hintText: hintText,
                ),
                controller: controller,
                validator: validator),
          ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    Text editSetTextWidget = Text(
      'Create Set',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        fontFamily: 'sans-serif-light',
        color: Colors.white,
      ),
    );

    return Container(
      height: 100.0,
      color: Color(0xFF181818), //background color
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Icon(
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
              child: editSetTextWidget,
            )
          ],
        ),
      ),
    );
  }

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
                  buildHeader(),
                  new Container(
                    //height: 1000.0,
                    constraints: new BoxConstraints(minHeight: 500),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),

                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Padding(
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
                                          'Set Information',
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
                            buildTextFormFieldLabel('Title'),
                            buildTextFormField(
                              controller: titleController,
                              hintText: 'Enter Your Title',
                              validator: (value) {
                                if (value.isEmpty || value == null) {
                                  return 'Value cannot be empty!';
                                }
                                return null;
                              },
                            ),
                            buildTextFormFieldLabel('Description'),
                            buildTextFormField(
                              controller: descriptionController,
                              hintText: 'Enter Your Description',
                              validator: (value) {
                                if (value.isEmpty || value == null) {
                                  return 'Value cannot be empty!';
                                }
                                return null;
                              },
                            ),
                            buildTextFormFieldLabel('Break Duration'),
                            buildTextFormField(
                              controller: breakDurationController,
                              hintText: 'Enter duration in form xx:xx',
                              validator: (value) {
                                if (value.isEmpty || value == null) {
                                  return 'Break duration is required';
                                }
                                if (!value.contains(':')) {
                                  return 'Enter duration in form xx:xx';
                                }
                                return null;
                              },
                            ),
                            buildTextFormFieldLabel('Exercises'),
                            SizedBox(
                              height: 10,
                            ),
                            buildChooseExercisesButton(),
                            SizedBox(
                              height: 10,
                            ),
                            if (selectedExercises.isNotEmpty)
                              buildReorderableList(),
                            SizedBox(
                              height: 15,
                            ),
                            buildCreateButton(),
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
                    'Exercise created successfully!',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                                    create: (_) => SetListViewModel(),
                                  ),
                                ],
                                child: ViewSetsScreen(false),
                              ),
                            ));
                      },
                      child: Text('Go to sets page'),
                    ),
                    SizedBox(
                      width: 4,
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
                                    create: (_) => SetListViewModel(),
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
            content: Column(mainAxisSize: MainAxisSize.min, children: [
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
                  'Failed to create exercise!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
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

class CustomExerciseListTile extends StatefulWidget {
  final ExerciseViewModel exercise;
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
              widget.exercise.coachName,
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
                selectedExercises.remove(widget.exercise);
                widget.notifyParent();
              },
            ),
          ],
        ),
      ),
    );
  }
}
