import 'package:flutter/material.dart';
import 'package:gym_project/common/my-list-tile-without-trailing.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:gym_project/helper/constants.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/viewmodels/exercise-view-model.dart';
import 'package:gym_project/viewmodels/group-list-view-model.dart';
import 'package:gym_project/viewmodels/groups-view-model.dart';
import 'package:gym_project/viewmodels/set-view-model.dart';
import 'package:gym_project/widget/grid_view_card.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class GroupDetailsScreen extends StatefulWidget {
  final int groupId;

  GroupDetailsScreen(this.groupId);

  @override
  _GroupDetailsScreenState createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  @override
  void initState() {
    super.initState();
    String token = Provider.of<User>(context, listen: false).token;
    Provider.of<GroupListViewModel>(context, listen: false)
        .fetchGroupDetails(widget.groupId, token);
  }

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
    GroupListViewModel groupListVM = Provider.of<GroupListViewModel>(context);
    GroupViewModel groupVM = groupListVM.group;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            if (groupListVM.loadingStatus == LoadingStatus.Searching)
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            if (groupListVM.loadingStatus == LoadingStatus.Completed)
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  child: Image.network(
                    "https://media.istockphoto.com/photos/kettlebell-and-medicine-ball-in-the-gym-equipment-for-functional-picture-id1153479113?k=20&m=1153479113&s=612x612&w=0&h=wLZnQE2GPjXJFYVpygKlNK5iyD8THMyPOGG4qFGr3xE=",
                    fit: BoxFit.fill,
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                  child: Text(
                    groupVM.title,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    groupVM.description,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "Exercises",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                    ),
                  ),
                ),
                for (ExerciseViewModel exercise
                      in groupVM.exercisesViewModels)
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: CustomListTileNoTrailing(
                      exercise.title,
                      [
                        formatDuration(exercise.duration),
                          '${exercise.calBurnt} cal'
                      ],
                    ),
                  ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "Sets",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'assets/fonts/Changa-Bold.ttf',
                    ),
                  ),
                ),
                for (SetViewModel set in groupVM.setsViewModels)
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: CustomListTileNoTrailing(
                      set.title,
                        [set.description],
                    ),
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
      ),
    );
  }
}
