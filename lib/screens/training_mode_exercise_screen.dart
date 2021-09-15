import 'dart:async';

import 'package:flutter/material.dart';

class TrainingModeExerciseScreen extends StatefulWidget {
  final String title;
  final Duration duration;
  final int reps;
  final String gif;

  const TrainingModeExerciseScreen({
    Key key,
    @required this.title,
    @required this.duration,
    @required this.reps,
    @required this.gif,
  }) : super(key: key);

  @override
  _TrainingModeExerciseScreenState createState() =>
      _TrainingModeExerciseScreenState();
}

class _TrainingModeExerciseScreenState
    extends State<TrainingModeExerciseScreen> {
  bool _counterFinished = false;
  bool _startCounting = false;
  Duration duration;

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    super.initState();
    duration = widget.duration;
    Timer(widget.duration, () {
      setState(() => _counterFinished = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                widget.gif,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      'Exercise Name',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() => _startCounting = true);
                  },
                  child: Text('Start'),
                ),
              ),
            ),
            StatefulBuilder(
              builder: (context, setTextState) {
                if (_startCounting && duration.inSeconds != 0) {
                  Timer(Duration(seconds: 1), () {
                    setTextState(() {
                      duration = Duration(seconds: duration.inSeconds - 1);
                    });
                  });
                }
                return Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                    'Time Left: ${printDuration(duration)} / ${printDuration(widget.duration)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
              );
              },
            )
          ],
        ),
      ),
    );
  }
}
