import 'package:flutter/material.dart';
import 'package:gym_project/screens/common/view-private-session-details.dart';
import 'package:gym_project/style/duration.dart';
import 'package:gym_project/style/error-pop-up.dart';
import 'package:gym_project/style/success-pop-up.dart';
import 'package:gym_project/viewmodels/private-session-list-view-model.dart';
import 'package:gym_project/viewmodels/private-session-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class ViewBookedSessionsScreen extends StatefulWidget {
  @override
  _ViewBookedSessionsScreenState createState() =>
      _ViewBookedSessionsScreenState();
}

List<PrivateSessionViewModel> privateSessions = [];

class _ViewBookedSessionsScreenState extends State<ViewBookedSessionsScreen> {
  String token;
  @override
  void initState() {
    super.initState();
    token = Provider.of<User>(context, listen: false).token;
    Provider.of<PrivateSessionListViewModel>(context, listen: false)
        .fetchListBookedPrivateSessions('member')
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

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
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
                                print(privateSessions[index].status);
                                return myListTile(
                                    privateSessions[index], index, token);
                              }),
            ],
          ),
        ]),
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
            // Text(
            //   privateSession.coachName,
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            // ),
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
            Text(
              '${privateSession.status}',
              style: TextStyle(color: Colors.amber),
            ),
            if (privateSession.status != 'cancelled')
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => EditPlanForm()));

                    Provider.of<PrivateSessionListViewModel>(context,
                            listen: false)
                        .cancelPrivateSession(privateSession.id)
                        .then((value) {
                      setState(() {
                        showSuccessMessage(
                            context, 'Session cancelled successfully!');
                      });
                    }).catchError((err) {
                      showErrorMessage(context, 'Failed to cancel session!');
                      print('Failed to delete session');
                    });
                  },
                  child: Text('Cancel',
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
