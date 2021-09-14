import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key key}) : super(key: key);
  static final String path = "lib/src/pages/ecommerce/ecommerce5.dart";

  @override
  ExercisesScreenState createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
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
      'duration': Duration(minutes: 1, seconds: 30),
      'coach': 'Amr Fatouh',
    },
    {
      'title': 'Spread Up',
      'image':
          'https://www.usnews.com/dims4/USNEWS/aa5868a/2147483647/crop/2118x1390%2B1%2B0/resize/640x420/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2F48%2F14%2F7957075045b49d3cbc401ef61eb8%2F210824-yoga-stock.jpg',
      'reps': null,
      'duration': Duration(minutes: 5),
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

  bool _selectionMode = false;
  List<Map<int, int>> _numberOfSelectedInstances = [];

  void setSelectionMode(bool value) {
    setState(() {
      _selectionMode = value;
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

  @override
  Widget build(BuildContext context) {
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
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Exercises",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 40),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          controller: TextEditingController(),
                          cursorColor: Theme.of(context).primaryColor,
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                  children: _exercises
                      .asMap()
                      .entries
                      .map((entry) => MyChoosingGridViewCard(
                            image: entry.value['image'],
                            title: entry.value['title'],
                            reps: entry.value['reps'],
                            duration: entry.value['duration'],
                            coach: entry.value['coach'],
                            index: entry.key,
                            selectionMode: _selectionMode,
                            setSelectionMode: setSelectionMode,
                            incrementItem: incrementItem,
                            decrementItem: decrementItem,
                            selectedItemsNumber: selectedItemsNumber,
                            isSelected: isSelected,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class MyChoosingGridViewCard extends StatefulWidget {
  MyChoosingGridViewCard({
    Key key,
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
  }) : super(key: key);

  final image;
  final title;
  final reps;
  final duration;
  final coach;

  final int index;
  final bool selectionMode;
  final Function setSelectionMode;
  final Function incrementItem;
  final Function decrementItem;
  final Function selectedItemsNumber;
  final Function isSelected;

  @override
  _MyChoosingGridViewCardState createState() => _MyChoosingGridViewCardState();
}

class _MyChoosingGridViewCardState extends State<MyChoosingGridViewCard> {
  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final double imageBorderRadius = widget.selectionMode ? 0 : 30;
    return GestureDetector(
      onLongPress: () {
        if (!widget.selectionMode) {
          widget.setSelectionMode(true);
          widget.incrementItem(widget.index);
        }
      },
      child: Container(
        height: 200,
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
            Container(
              width: double.infinity,
              height: widget.selectionMode ? 80 : 115,
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
            SizedBox(
              height: 5,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            if (widget.reps != null)
              Text(
                'Reps: ${widget.reps}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            if (widget.duration != null)
              Text(
                'Duration: ${printDuration(widget.duration)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            Text('Create by:  ${widget.coach}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
