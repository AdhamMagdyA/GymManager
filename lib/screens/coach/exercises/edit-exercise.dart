import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/screens/coach/equipment/equipments-list.dart';
import 'package:gym_project/viewmodels/equipment-list-view-model.dart';
import 'package:gym_project/viewmodels/equipment-view-model.dart';
import 'package:gym_project/viewmodels/exercise-list-view-model.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';
import 'package:gym_project/widget/back-button.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../coach-tabs-screen.dart';
import 'exercises_screen.dart';

EquipmentViewModel selectedEquipment;

class EditExerciseForm extends StatefulWidget {
  final int id;

  EditExerciseForm({this.id});
  @override
  MapScreenState createState() => MapScreenState();
}

//you can change the form heading from line 51,93
//you can change the form fields from lines (119 ,138 , etc ) -> each padding represent a field
class MapScreenState extends State<EditExerciseForm>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  XFile _imageFile;
  XFile _gifFile;
  final ImagePicker _picker = ImagePicker();

  Exercise _exercise;
  bool status = false;

  bool emptyImage = false;
  bool emptyGIF = false;
  bool emptyEquipment = false;

  @override
  void didChangeDependencies() {
    if (status) {
      exerciseListViewModel = Provider.of<ExerciseListViewModel>(context);
    }
    super.didChangeDependencies();
  }

  TextEditingController titleController;
  TextEditingController descriptionController;
  TextEditingController durationController;
  TextEditingController repetitionsController;
  TextEditingController caloriesController;
  ExerciseListViewModel exerciseVM;
  ExerciseViewModel exercise;
  bool error = false;
  @override
  void initState() {
    super.initState();
    var token = Provider.of<User>(context, listen: false).token;
    print(token);
    Provider.of<ExerciseListViewModel>(context, listen: false)
        .fetchExercise(widget.id, token)
        .then((value) {
      exerciseVM = Provider.of<ExerciseListViewModel>(context, listen: false);
      exercise = exerciseVM.exercise;
      setState(() {
        selectedEquipment = EquipmentViewModel(e: exercise.equipment);
        titleController = TextEditingController(text: exercise.title);
        descriptionController =
            TextEditingController(text: exercise.description);
        durationController = TextEditingController(text: exercise.duration);
        repetitionsController =
            TextEditingController(text: exercise.reps.toString());
        caloriesController =
            TextEditingController(text: exercise.calBurnt.toString());
      });
    }).catchError((err) {
      error = true;
      print('error occured $err');
    });
  }

  refresh() {
    setState(() {});
  }

  bool saveExercise() {
    setState(() {
      Provider.of<ExerciseListViewModel>(context, listen: false)
          .editExercise(
              exercise, Provider.of<User>(context, listen: false).token)
          .then((value) => {showSuccessMessage(context)})
          .catchError((err) {
        print('error occured $err');
        showErrorMessage(context);
        return false;
      });
    });
    return true;
  }

  Widget imageProfile(String imageType) {
    ImageProvider backgroundImage;
    if (imageType == 'image') {
      if (_imageFile == null)
        backgroundImage = AssetImage("assets/images/as.png");
      else if (kIsWeb)
        backgroundImage = NetworkImage(_imageFile.path);
      else
        backgroundImage = FileImage(File(_imageFile.path));
    } else if (imageType == 'gif') {
      if (_gifFile == null)
        backgroundImage = AssetImage("assets/images/as.png");
      else if (kIsWeb)
        backgroundImage = NetworkImage(_gifFile.path);
      else
        backgroundImage = FileImage(File(_gifFile.path));
    }
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(radius: 80.0, backgroundImage: backgroundImage),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet(imageType)),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.3),
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet(String imageType) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera, imageType);
                Navigator.of(context).pop();
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery, imageType);
                Navigator.of(context).pop();
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source, String imageType) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      if (imageType == 'image')
        _imageFile = pickedFile;
      else if (imageType == 'gif') _gifFile = pickedFile;
    });
  }

  var exerciseListViewModel;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(widget.id);

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
                                  child: new Text('Edit Exercise',
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
                      child: exercise == null
                          ? Stack(
                              children: [
                                CustomBackButton(),
                                Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          : Form(
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
                                                'Exercise Information',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
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
                                                if (value.isEmpty ||
                                                    value == null) {
                                                  return 'Value cannot be empty!';
                                                }
                                                return null;
                                              },
                                              controller: descriptionController,
                                              decoration: InputDecoration(
                                                hintText:
                                                    "Enter Your Description",
                                                // errorText: descriptionValidate
                                                //     ? 'Value cannot be empty!'
                                                //     : null,
                                                // errorBorder: new OutlineInputBorder(
                                                //   borderSide: new BorderSide(
                                                //     color: Colors.red,
                                                //     width: 0,
                                                //   ),
                                                // ),
                                              ),
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
                                                'Duration ',
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
                                                if (value.isEmpty ||
                                                    value == null) {
                                                  return 'Value cannot be empty!';
                                                }
                                                return null;
                                              },
                                              controller: durationController,
                                              decoration: const InputDecoration(
                                                  hintText:
                                                      "Enter duration h:m:s"),
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
                                                if (value.isEmpty ||
                                                    value == null) {
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
                                              'Gif',
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
                                  ),
                                  if (emptyGIF)
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
                                              Center(
                                                child: new Text(
                                                  'Insert GIF',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            imageProfile('gif'),
                                          ],
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
                                                'Repetitions',
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
                                              maxLength: 3,
                                              validator: (value) {
                                                if (value.isEmpty ||
                                                    value == null) {
                                                  return 'Value cannot be empty!';
                                                }
                                                if (value.length > 3) {
                                                  return 'length must not exceed 3!';
                                                }
                                                return null;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: repetitionsController,
                                              decoration: const InputDecoration(
                                                  hintText:
                                                      "Enter number of repetitions"),
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
                                                'Calories',
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
                                              print(value);
                                              if (value.isEmpty ||
                                                  value == null) {
                                                return 'Value cannot be empty!';
                                              }

                                              return null;
                                            },
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            controller: caloriesController,
                                            decoration: const InputDecoration(
                                                hintText: "Enter Calories"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
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
                                                'Image',
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
                                  if (emptyImage)
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
                                              Center(
                                                child: new Text(
                                                  'Insert Image',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            imageProfile('image'),
                                          ],
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
                                              'Equipment',
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
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: ElevatedButton(
                                                child: Text(
                                                  'Choose Equipment',
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    textStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    primary: Colors.amber,
                                                    onPrimary: Colors.black,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    )),
                                                onPressed: () async {
                                                  EquipmentViewModel result =
                                                      await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                MultiProvider(
                                                              providers: [
                                                                ChangeNotifierProvider(
                                                                  create: (_) =>
                                                                      EquipmentListViewModel(),
                                                                ),
                                                              ],
                                                              child:
                                                                  EquipmentsList(
                                                                      true),
                                                            ),
                                                          ));
                                                  setState(() {
                                                    if (result != null)
                                                      selectedEquipment =
                                                          result;
                                                    print(selectedEquipment);
                                                  });
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (selectedEquipment != null)
                                    CustomEquipmentListTile(
                                        selectedEquipment, refresh),
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
                                        // print('paths');
                                        // print(_gifFile.path);
                                        // print(_imageFile.path);
                                        // print('Now exercise can be created!');

                                        if (_formKey.currentState.validate()) {
                                          exercise.title = titleController.text;
                                          exercise.description =
                                              descriptionController.text;
                                          exercise.duration =
                                              durationController.text;
                                          exercise.reps = int.parse(
                                              repetitionsController.text);
                                          exercise.image = _imageFile != null
                                              ? _imageFile.path.substring(5)
                                              : exercise.image;
                                          exercise.gif = _gifFile != null
                                              ? _gifFile.path.substring(5)
                                              : exercise.gif;
                                          exercise.calBurnt = double.parse(
                                              caloriesController.text);
                                          exercise.equipment =
                                              selectedEquipment.equipment;

                                          status = saveExercise();

                                          print("Back!");
                                        }
                                        // if (_gifFile == null) {
                                        //   setState(() {
                                        //     emptyGIF = true;
                                        //   });
                                        // }
                                        // if (_imageFile == null) {
                                        //   setState(() {
                                        //     emptyImage = true;
                                        //   });
                                        // }
                                        if (selectedEquipment == null) {
                                          setState(() {
                                            emptyEquipment = true;
                                          });
                                        }

                                        // // if (exerciseListViewModel.exercise != null)
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
                    'Exercise edited successfully!',
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
                                    create: (_) => ExerciseListViewModel(),
                                  ),
                                ],
                                child: ExercisesScreen(false),
                              ),
                            ));
                      },
                      child: Text('Go to exercises page'),
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
                    'Failed to create exercise!',
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

class CustomEquipmentListTile extends StatefulWidget {
  final EquipmentViewModel equipment;
  final Function() notifyParent;

  CustomEquipmentListTile(this.equipment, this.notifyParent);
  @override
  _CustomEquipmentListTileState createState() =>
      _CustomEquipmentListTileState();
}

class _CustomEquipmentListTileState extends State<CustomEquipmentListTile> {
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
          child: FlutterLogo(),
        ),
        title: Text(
          widget.equipment.name,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.equipment.description,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
        trailing: GestureDetector(
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onTap: () {
            selectedEquipment = null;
            widget.notifyParent();
          },
        ),
      ),
    );
  }
}
















// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:gym_project/models/exercise.dart';
// import 'package:gym_project/screens/coach/coach-tabs-screen.dart';
// import 'package:gym_project/screens/coach/equipment/equipments-list.dart';
// import 'package:gym_project/screens/coach/exercises/exercises_screen.dart';
// import 'package:gym_project/viewmodels/equipment-list-view-model.dart';
// import 'package:gym_project/viewmodels/equipment-view-model.dart';
// import 'package:gym_project/viewmodels/exercise-list-view-model.dart';
// // import 'package:gym_project/viewmodels/exercise-view-model.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:path/path.dart' as Path;

// import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
// import 'dart:io';

// EquipmentViewModel selectedEquipment;

// class EditExerciseForm extends StatefulWidget {
//   @override
//   MapScreenState createState() => MapScreenState();
// }

// //you can change the form heading from line 51,93
// //you can change the form fields from lines (119 ,138 , etc ) -> each padding represent a field
// class MapScreenState extends State<EditExerciseForm>
//     with SingleTickerProviderStateMixin {
//   bool _status = true;
//   final FocusNode myFocusNode = FocusNode();
//   XFile _imageFile;
//   XFile _gifFile;
//   final ImagePicker _picker = ImagePicker();
//   Exercise _exercise;

//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController durationController = TextEditingController();
//   TextEditingController repetitionsController = TextEditingController();
//   TextEditingController caloriesController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Provider.of<ExerciseListViewModel>(context, listen: false)
//     //     .postExercise(_exercise);
//   }

//   refresh() {
//     setState(() {});
//   }

//   // Future<String> saveFile(XFile image) async {
//   //   final Directory directory = await getApplicationDocumentsDirectory();
//   //   final String path = directory.path;
//   //   final fileName = Path.basename(image.path);
//   //   image.saveTo('$path/$fileName');
//   //   print('$path/$fileName');
//   //   return '$path/$fileName';
//   // }

//   Widget imageProfile(String imageType) {
//     ImageProvider backgroundImage;

//     if (imageType == 'image') {
//       if (_imageFile == null)
//         backgroundImage = AssetImage("assets/images/as.png");
//       else if (kIsWeb)
//         backgroundImage = NetworkImage(_imageFile.path);
//       else
//         backgroundImage = FileImage(File(_imageFile.path));
//     } else if (imageType == 'gif') {
//       if (_gifFile == null)
//         backgroundImage = AssetImage("assets/images/as.png");
//       else if (kIsWeb)
//         backgroundImage = NetworkImage(_gifFile.path);
//       else
//         backgroundImage = FileImage(File(_gifFile.path));
//     }
//     return Center(
//       child: Stack(children: <Widget>[
//         CircleAvatar(radius: 80.0, backgroundImage: backgroundImage),
//         Positioned(
//           bottom: 20.0,
//           right: 20.0,
//           child: InkWell(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: ((builder) => bottomSheet(imageType)),
//               );
//             },
//             child: CircleAvatar(
//               backgroundColor: Colors.black.withOpacity(0.3),
//               child: Icon(
//                 Icons.camera_alt,
//                 color: Colors.teal,
//                 size: 28.0,
//               ),
//             ),
//           ),
//         ),
//       ]),
//  
