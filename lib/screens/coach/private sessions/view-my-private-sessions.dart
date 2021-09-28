import 'package:flutter/material.dart';
import 'package:gym_project/screens/coach/private%20sessions/edit-private-session.dart';
import 'package:gym_project/screens/common/view-private-session-details.dart';
import 'package:gym_project/viewmodels/private-session-list-view-model.dart';
import 'package:gym_project/viewmodels/private-session-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class ViewMyPrivateSessionsScreen extends StatefulWidget {
  @override
  _ViewMyPrivateSessionsScreenState createState() =>
      _ViewMyPrivateSessionsScreenState();
}

List<PrivateSessionViewModel> privateSessions = [];

class _ViewMyPrivateSessionsScreenState
    extends State<ViewMyPrivateSessionsScreen> {
  String token;
  @override
  void initState() {
    super.initState();
    token = Provider.of<User>(context, listen: false).token;
    Provider.of<PrivateSessionListViewModel>(context, listen: false)
        .fetchListMyPrivateSessions()
        .then((value) {
      sessionListViewModel =
          Provider.of<PrivateSessionListViewModel>(context, listen: false);
      setState(() {
        done = true;
        privateSessions = sessionListViewModel.privateSessions;
      });
    }).catchError((err) {
      error = true;
      print('error occured $err');
    });
  }

  var sessionListViewModel;
  bool done = false;
  bool error = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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

  String formatDateTime(String dateTime) {
    //2021-09-13 14:13:51
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    String year = dateTime.substring(0, 4);
    String month = dateTime.substring(5, 7);
    String day = dateTime.substring(8, 10);
    String time = dateTime.substring(12);
    return '$day ${months[int.parse(month) - 1]} $year at $time';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Provider.of<User>(context, listen: false).role == "member" ||
              Provider.of<User>(context, listen: false).role == "admin"
          ? AppBar(
              title: Text(
                'Private Sessions',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xff181818),
              iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
            )
          : PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(),
            ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: EdgeInsetsDirectional.all(10),
          child: Stack(children: [
            ListView(
              children: [
                Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextFormField(
                      controller: TextEditingController(),
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          hintText: 'Search..',
                          suffixIcon: Material(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    )),
                SizedBox(height: 20),
                error
                    ? Center(
                        child: Text(
                          'An error occurred',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : (done && privateSessions.isEmpty)
                        ? Center(
                            child: Text(
                              'No private sessions found',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : privateSessions.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: privateSessions.length,
                                itemBuilder: (ctx, index) {
                                  return myListTile(
                                    privateSessions[index],
                                    index,
                                    token,
                                  );
                                }),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget myListTile(
      PrivateSessionViewModel privateSession, int index, String token) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PrivateSessionDetailsScreen(privateSession)));
        },
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: FlutterLogo(),
        ),
        title: Text(
          privateSession.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              privateSession.coachName,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              formatDuration(privateSession.duration),
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
        trailing: Column(
          children: [
            Text(
              '\$${privateSession.price}',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              child: TextButton(
                onPressed: Provider.of<User>(context).role == "admin" ||
                        Provider.of<User>(context).role == "coach"
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditPrivateSessionForm(privateSession.id)));
                      }
                    : () {},
                child: Provider.of<User>(context).role == "admin" ||
                        Provider.of<User>(context).role == "coach"
                    ? Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(''),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => EditPlanForm()));

                  Provider.of<PrivateSessionListViewModel>(context,
                          listen: false)
                      .deletePrivateSession(privateSession.id)
                      .then((value) {
                    setState(() {
                      privateSessions.remove(privateSession);
                    });
                  }).catchError((err) => {print('Failed to delete session')});
                },
                child: Text('Delete',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
