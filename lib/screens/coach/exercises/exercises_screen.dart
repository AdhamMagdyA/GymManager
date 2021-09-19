import 'package:flutter/material.dart';
import 'package:gym_project/screens/coach/exercises/edit-exercise.dart';
import 'package:gym_project/viewmodels/exercise-list-view-model.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';
import 'package:provider/provider.dart';

import '../../common/view-exercises-details-screen.dart';

class ExercisesScreen extends StatefulWidget {
  bool isSelectionTime = false;
  ExercisesScreen(this.isSelectionTime);
  static String routeName = '/exercises/index';

  @override
  ExercisesScreenState createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
  // List<ExerciseViewModel> _exercises = [];
  List<Map> _exercises = [
    {
      'title': 'Leg Pushes',
      'image':
          'https://www.bodybuilding.com/images/2016/june/leg-workouts-for-men-7-best-workouts-for-quads-glutes-hams-header-v2-960x540.jpg',
      'reps': 10,
      'duration': null,
      'coach': 'Amr Fatouh',
    },
    {
      'title': 'Dumbell Curls',
      'image': 'https://ak.picdn.net/shutterstock/videos/32071954/thumb/1.jpg',
      'reps': 15,
      'duration': null,
      'coach': 'Amr Fatouh',
    },
    {
      'title': 'Crunches',
      'image':
          'https://yegfitness.ca/wp-content/uploads/2021/07/How-Nutrition-Can-Improve-Your-Workout-Quality.jpg',
      'reps': 15,
      'duration': null,
      'coach': 'Amr Fatouh',
    },
    {
      'title': 'Rope Swings',
      'image':
          'https://www.mensjournal.com/wp-content/uploads/2018/09/eytfhjb.jpg?w=1152&h=630&crop=1&quality=86&strip=all',
      'reps': null,
      'duration': '01:30',
      'coach': 'Amr Fatouh',
    },
    {
      'title': 'Spread Up',
      'image':
          'https://www.usnews.com/dims4/USNEWS/aa5868a/2147483647/crop/2118x1390%2B1%2B0/resize/640x420/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2F48%2F14%2F7957075045b49d3cbc401ef61eb8%2F210824-yoga-stock.jpg',
      'reps': null,
      'duration': '05:00',
      'coach': 'Amr Fatouh',
    },
    {
      'title': 'Bar Lifting',
      'image':
          'https://www.ironmaster.com/mm5/graphics/00000001/woo/2016/07/im1500-3-e1502822806930.jpg',
      'reps': 10,
      'duration': null,
      'coach': 'Amr Fatouh',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Provider.of<ExerciseListViewModel>(context, listen: false)
    //     .fetchListExercises();
  }

  bool _selectionMode = false;
  List<Map<int, int>> _numberOfSelectedInstances = [];
  Map<int, Object> finalSelectedItems = {};
  bool _argumentsLoaded = false;
  List<Map<Object, Object>> oldSelectedExercise = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_argumentsLoaded) {
      oldSelectedExercise = ModalRoute.of(context).settings.arguments;
      if (oldSelectedExercise.isNotEmpty) {
        setState(() {
          oldSelectedExercise.forEach((exercise) {
            _numberOfSelectedInstances
                .add({exercise['index'] as int: exercise['value'] as int});
            _selectionMode = true;
          });
        });
      }
      _argumentsLoaded = true;
    }
  }

  void setSelectionMode(bool value) {
    setState(() {
      _selectionMode = value;
      widget.isSelectionTime = value;
    });
  }

  void incrementItem(int index) {
    setState(() {
      int i = _numberOfSelectedInstances
          .indexWhere((map) => map.containsKey(index));
      if (i != -1) {
        _numberOfSelectedInstances[i][index] =
            _numberOfSelectedInstances[i][index] + 1;
      } else {
        _numberOfSelectedInstances.add({index: 1});
      }
    });
  }

  void decrementItem(int index) {
    setState(() {
      int i = _numberOfSelectedInstances
          .indexWhere((map) => map.containsKey(index));
      if (i == -1) return;
      if (_numberOfSelectedInstances[i][index] == 1) {
        _numberOfSelectedInstances.removeWhere((map) => map.containsKey(index));
      } else {
        _numberOfSelectedInstances[i][index] =
            _numberOfSelectedInstances[i][index] - 1;
      }
    });
  }

  int selectedItemsNumber(index) {
    if (!_numberOfSelectedInstances.any((map) => map.containsKey(index))) {
      return 0;
    } else {
      return _numberOfSelectedInstances
          .firstWhere((map) => map.containsKey(index))[index];
    }
  }

  bool isSelected(int index) {
    return _numberOfSelectedInstances.any((map) => map.containsKey(index));
  }

  void getFinalSelectedItems() {
    int index = 0;
    for (Map<int, int> selectedItem in _numberOfSelectedInstances) {
      selectedItem.forEach((key, value) {
        // print(sets[key]);
        for (int i = 0; i < value; i++) {
          finalSelectedItems[index] = _exercises[key];
          index++;
        }
        finalSelectedItems[key] = {
          ..._exercises[key],
          'value': value,
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var exerciseListViewModel = Provider.of<ExerciseListViewModel>(context);
    // _exercises = exerciseListViewModel.exercises;
    print('Now exercises is');
    print(_exercises);
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.black,
            ),
            width: double.infinity,
          ),
          Container(
            margin: EdgeInsets.only(left: 230, bottom: 20),
            width: 220,
            height: 190,
            decoration: BoxDecoration(
                color: Color(0xFFFFCE2B),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(190),
                    bottomLeft: Radius.circular(290),
                    bottomRight: Radius.circular(160),
                    topRight: Radius.circular(0))),
          ),
          _exercises.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
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
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Exercises",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Material(
                              elevation: 5.0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: TextField(
                                controller: TextEditingController(),
                                cursorColor: Theme.of(context).primaryColor,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                decoration: InputDecoration(
                                  labelText: 'Search',
                                  suffixIcon: Material(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    child: Icon(Icons.search),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_selectionMode)
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Selected ${_numberOfSelectedInstances.length} of ${_exercises.length}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectionMode = false;
                                  _numberOfSelectedInstances.clear();
                                });
                              },
                              icon: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.black.withOpacity(0.3),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    SliverPadding(
                      padding: const EdgeInsets.all(26.0),
                      sliver: SliverGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8,
                        children: [
                          for (int index = 0;
                              index < _exercises.length;
                              index++)
                            MyChoosingGridViewCard(
                                id: _exercises[index]['id'],
                                image: _exercises[index]['image'],
                                title: _exercises[index]['title'],
                                reps: _exercises[index]['reps'],
                                duration: _exercises[index]['duration'],
                                coach: _exercises[index]['coach'],
                                index: index,
                                selectionMode: _selectionMode,
                                setSelectionMode: setSelectionMode,
                                incrementItem: incrementItem,
                                decrementItem: decrementItem,
                                selectedItemsNumber: selectedItemsNumber,
                                isSelected: isSelected,
                                selectionTime: widget.isSelectionTime)
                        ],
                      ),
                    ),
                  ],
                ),
          if (_selectionMode)
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    getFinalSelectedItems();
                    Navigator.pop(context, finalSelectedItems);
                  }),
            ),
        ],
      ),
    ));
  }
}

class MyChoosingGridViewCard extends StatefulWidget {
  MyChoosingGridViewCard({
    Key key,
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.reps,
    @required this.duration,
    @required this.coach,
    @required this.index,
    @required this.selectionMode,
    @required this.setSelectionMode,
    @required this.incrementItem,
    @required this.decrementItem,
    @required this.selectedItemsNumber,
    @required this.isSelected,
    @required this.selectionTime,
  }) : super(key: key);

  final image;
  final title;
  final reps;
  final duration;
  final coach;
  final id;
  final int index;
  final bool selectionMode;
  final Function setSelectionMode;
  final Function incrementItem;
  final Function decrementItem;
  final Function selectedItemsNumber;
  final Function isSelected;
  final bool selectionTime;

  @override
  _MyChoosingGridViewCardState createState() => _MyChoosingGridViewCardState();
}

class _MyChoosingGridViewCardState extends State<MyChoosingGridViewCard> {
  // String printDuration(Duration duration) {
  //   String twoDigits(int n) => n.toString().padLeft(2, "0");
  //   String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  //   String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  //   return "$twoDigitMinutes:$twoDigitSeconds";
  // }
  String formatDuration(String duration) {
    String finalDuration = 'Duration: ';
    String hours = duration.substring(0, 2);
    if (hours != '00') {
      if (hours[0] == '0') {
        finalDuration += '${hours[1]}h';
      } else {
        finalDuration += '${hours}h';
      }
    }
    String minutes = duration.substring(3, 5);
    if (minutes != '00') {
      if (minutes[0] == '0') {
        finalDuration += ' ${minutes[1]}m';
      } else {
        finalDuration += ' ${minutes}m';
      }
    }
    if (duration.length == 8) {
      String seconds = duration.substring(6);
      if (seconds != '00') {
        if (seconds[0] == '0') {
          finalDuration += ' ${seconds[1]}s';
        } else {
          finalDuration += ' ${seconds}s';
        }
      }
    }
    return finalDuration;
  }

  @override
  Widget build(BuildContext context) {
    print('${widget.title} ${widget.id}');
    final double imageBorderRadius = widget.selectionMode ? 0 : 30;
    return GestureDetector(
      onLongPress: () {
        if (!widget.selectionMode) {
          widget.setSelectionMode(true);
          widget.incrementItem(widget.index);
        }
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // builder: (context) => MultiProvider(
            //   providers: [
            //     ChangeNotifierProvider(
            //       create: (_) => ExerciseListViewModel(),
            //     ),
            //   ],
            //   child: ExerciseDetailsScreen(),
            // ),
            builder: (context) => ExerciseDetailsScreen(),
          ),
        );
      },
      child: Container(
        height: 500,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0,
            ),
          ],
          color: widget.isSelected(widget.index)
              ? Colors.blue.withOpacity(0.5)
              : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (widget.selectionMode)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => widget.incrementItem(widget.index),
                      icon: Icon(Icons.add)),
                  Text(
                    '${widget.selectedItemsNumber(widget.index)}',
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: !widget.isSelected(widget.index)
                          ? null
                          : () => widget.decrementItem(widget.index),
                      icon: Icon(Icons.remove)),
                ],
              ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: widget.selectionMode ? 70 : 110,
                padding: EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(imageBorderRadius),
                    topLeft: Radius.circular(imageBorderRadius),
                  ),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 20,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            if (widget.reps != null)
              SizedBox(
                height: 20,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Reps: ${widget.reps}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            if (widget.duration != null)
              SizedBox(
                height: 20,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    formatDuration(widget.duration),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 20,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('Created by:  ${widget.coach}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    )),
              ),
            ),
            //add condition for edit button
            if (!widget.selectionTime && !widget.selectionMode)
              SizedBox(
                height: 20,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Center(
                    child: TextButton(
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.amber,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditExerciseForm(),
                            ));
                      },
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
