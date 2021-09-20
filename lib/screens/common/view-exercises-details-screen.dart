import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:gym_project/viewmodels/exercise-list-view-model.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';
import 'package:gym_project/widget/grid_view_card.dart';
import 'package:provider/provider.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  final int id;

  ExerciseDetailsScreen(this.id);

  @override
  _ExerciseDetailsScreenState createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
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

  ExerciseViewModel _exercise;
  String formattedDuration = '';
  @override
  void initState() {
    super.initState();
    Provider.of<ExerciseListViewModel>(context, listen: false)
        .fetchExercise(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var exerciseViewModel = Provider.of<ExerciseListViewModel>(context);
    _exercise = exerciseViewModel.exercise;
    if (_exercise != null) {
      formattedDuration = formatDuration(_exercise.duration);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: _exercise == null
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        _exercise.image,
                        fit: BoxFit.fill,
                      ),
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                          child: Text(
                            _exercise.title,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'assets/fonts/Changa-Bold.ttf',
                            ),
                          ),
                        ),
                        Container(
                          child: Text("${_exercise.calBurnt} cal",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 15,
                                fontFamily: 'assets/fonts/Changa-Bold.ttf',
                              )),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            '${_exercise.reps} repetitions',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'assets/fonts/Changa-Bold.ttf',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "${formattedDuration}",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.amber,
                              fontFamily: 'assets/fonts/Changa-Bold.ttf',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Created by Coach: ${_exercise.coachName}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'assets/fonts/Changa-Bold.ttf',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        _exercise.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 15.0,
                          fontFamily: 'assets/fonts/ProximaNova-Regular.otf',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        "Equipment",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'assets/fonts/Changa-Bold.ttf',
                        ),
                      ),
                    ),
                    CustomScrollView(
                      shrinkWrap: true,
                      slivers: <Widget>[
                        SliverPadding(
                          padding:
                              const EdgeInsets.only(left: 80.0, right: 80.0),
                          sliver: SliverGrid.count(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => EquipmentDetails()));
                                },
                                child: GridViewCard(_exercise.equipment.picture,
                                    _exercise.equipment.name, '', '', '', ''),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
              ],
            ),
    );
  }
}
