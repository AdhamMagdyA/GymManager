import 'dart:async';

import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:gym_project/screens/training_mode_exercise_screen.dart';

class TrainingModeOverviewScreen extends StatefulWidget {
  TrainingModeOverviewScreen({Key key}) : super(key: key);

  @override
  _TrainingModeOverviewScreenState createState() =>
      _TrainingModeOverviewScreenState();
}

class _TrainingModeOverviewScreenState
    extends State<TrainingModeOverviewScreen> {
  final List<Map<String, dynamic>> _exercises = [
    {
      'title': 'Burpees',
      'duration': Duration(seconds: 3),
      'reps': null,
      'calories': 150,
      'gif': 'https://c.tenor.com/u2-VJiigKCkAAAAC/exercise-jump.gif',
    },
    {
      'title': 'Bicep Curls',
      'duration': null,
      'reps': 10,
      'calories': 100,
      'gif': 'https://thumbs.gfycat.com/FelineSaltyBat-max-1mb.gif',
    },
    {
      'title': 'Push Ups',
      'duration': Duration(seconds: 3),
      'reps': null,
      'calories': 150,
      'gif': 'https://c.tenor.com/gI-8qCUEko8AAAAC/pushup.gif',
    },
    {
      'title': 'Lunges',
      'duration': null,
      'reps': 20,
      'calories': 150,
      'gif': 'https://c.tenor.com/meIUZZ_2oZMAAAAC/lunge-jump.gif',
    },
  ];

  int _currentExerciseIndex = 0;
  bool _groupFinished = false;
  Duration _timeElapased = Duration(seconds: 0);
  Timer _timer;
  int _completedExercises = 0;
  bool _groupStarted = false;

  //with hours
  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  Map<String, dynamic> get currentExercise {
    return _exercises[_currentExerciseIndex];
  }

  double get currentCaloriesBurnt {
    return _exercises
        .take(_completedExercises)
        .map((exerciseMap) => exerciseMap['calories'])
        .fold(0, (previousValue, calories) => previousValue + calories);
  }

  void finishExercise() {
    _completedExercises++;
    setState(() {
      if (_currentExerciseIndex + 1 < _exercises.length) {
        _currentExerciseIndex += 1;
        Navigator.of(context).pop();
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, _, __) => TrainingModeExerciseScreen(
              title: currentExercise['title'],
              duration: currentExercise['duration'],
              reps: currentExercise['reps'],
              gif: currentExercise['gif'],
              index: _currentExerciseIndex,
              total: _exercises.length,
              finishExercise: finishExercise,
            ),
          ),
        );
      } else {
        finishGroup();
      }
    });
  }

  void finishGroup() {
    _groupFinished = true;
    _timer.cancel();
    Navigator.of(context).pop();
  }

  void startGroup() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _timeElapased = Duration(seconds: _timeElapased.inSeconds + 1);
    });
    setState(() {
      _groupStarted = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: AppBar(
        title: Text("Training Mode"),
        actions: [
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
            color: Colors.black,
          )
        ],
      ),
      drawer: Drawer(),
      backLayer: !_groupStarted
          ? Container(
              padding: EdgeInsets.all(30),
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Group isn\'t started yet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: startGroup,
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'Start The Group Now',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            )
          : _groupFinished
              ? Container(
                  padding: EdgeInsets.all(30),
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Congratulations!',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'You have completed this workout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 25),
                      Icon(
                        Icons.celebration,
                        size: 150,
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                      )
                    ],
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.black,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${currentExercise['title']}',
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: 20),
                          Chip(
                            label: Text(
                              '${_currentExerciseIndex + 1} / ${_exercises.length}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                          )
                        ],
                      ),
                    ),
                Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: Image.network(
                      currentExercise['gif'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.black,
                      alignment: Alignment.center,
                  child: InkButton(
                        currentExercise,
                        finishExercise,
                        index: _currentExerciseIndex,
                        total: _exercises.length,
                      ),
                    ),
                  ],
                ),
      frontLayer: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Group Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nisi irure cupidatat labore cillum mollit cillum ullamco irure eu culpa nisi incididunt in ex ea. Eiusmod amet dolore ea deserunt mollit enim non anim ea sint non aute qui. Veniam incididunt quis ad elit minim culpa proident excepteur amet non culpa in. Qui aliquip quis adipisicing. Dolor dolor ad non ut cillum fugiat reprehenderit amet.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Workout Summary',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WorkoutSummaryTile(
                    title: '${currentCaloriesBurnt.toStringAsFixed(2)}',
                    subtitle: 'Calories Burnt',
                  ),
                  StatefulBuilder(builder: (context, setTileState) {
                    Timer(Duration(seconds: 1), () => setTileState(() {}));
                    return WorkoutSummaryTile(
                      title: printDuration(_timeElapased),
                      subtitle: 'Ellapsed',
                    );
                  }),
                  WorkoutSummaryTile(
                    title: '$_completedExercises / ${_exercises.length}',
                    subtitle: 'Exercises Done',
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!_groupStarted)
                      ElevatedButton(
                        onPressed: startGroup,
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    if (_groupFinished)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Workout Completed',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.check, size: 30, color: Colors.green)
                        ],
                      ),
                    Container(
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'View Group Details',
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InkButton extends StatelessWidget {
  const InkButton(
    this.currentExercise,
    this.finishExercise, {
    @required this.total,
    @required this.index,
    Key key,
  }) : super(key: key);

  final Map<String, dynamic> currentExercise;
  final Function finishExercise;
  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    // used Material, Ink and InkWell instead of Elevated Button
    // there is an issue with ElevatedButton and the backdrop package
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        width: 150,
        height: 30,
        child: Center(
          child: InkWell(
            splashColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => TrainingModeExerciseScreen(
                    title: currentExercise['title'],
                    duration: currentExercise['duration'],
                    reps: currentExercise['reps'],
                    gif: currentExercise['gif'],
                    index: index,
                    total: total,
                    finishExercise: finishExercise,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Go To Next Exercise',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WorkoutSummaryTile extends StatelessWidget {
  const WorkoutSummaryTile({
    @required this.title,
    @required this.subtitle,
    Key key,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff333333),
      child: Container(
        height: 75,
        width: 75,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
