import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:gym_project/screens/training_mode_exercise_screen.dart';

class TrainingModeOverviewScreen extends StatelessWidget {

  TrainingModeOverviewScreen({Key key}) : super(key: key);

  final _group = {
    'title': 'Chest Group',
    'description': 'A group where all chest muscles are trained',
    'creator': 'Amr Fatouh',
    'exercises': [
      {
        'title': 'Frasha',
        'description': 'swing with the machine',
        'duration': null,
        'reps': 10,
        'calories': 100,
        'image': '',
        'gif': '',
        'creator': 'Amr Fatouh',
      }
    ],
  };

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: AppBar(
        title: Text("Training Mode"),
        actions: [
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      drawer: Drawer(),
      backLayer: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Image.network(
                'https://thumbs.gfycat.com/ForcefulNimbleHydra-size_restricted.gif',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.center,
            child: InkButton(),
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
                  WorkoutSummaryTile(title: '24', subtitle: 'Calories Burnt'),
                  WorkoutSummaryTile(title: '00:15:31', subtitle: 'Ellapsed'),
                  WorkoutSummaryTile(title: '11', subtitle: 'Exercises Done'),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InkButton extends StatelessWidget {
  const InkButton({
    Key key,
  }) : super(key: key);

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
                  builder: (ctx) => TrainingModeExerciseScreen(),
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
