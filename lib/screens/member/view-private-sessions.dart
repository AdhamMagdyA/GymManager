import 'package:flutter/material.dart';
import 'package:gym_project/screens/common/view-private-session-details.dart';
import 'package:gym_project/style/duration.dart';
import 'package:gym_project/viewmodels/private-session-list-view-model.dart';
import 'package:gym_project/viewmodels/private-session-view-model.dart';
import 'package:gym_project/widget/back-button.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class ViewPrivateSessionsScreen extends StatefulWidget {
  @override
  _ViewPrivateSessionsScreenState createState() =>
      _ViewPrivateSessionsScreenState();
}

List<PrivateSessionViewModel> privateSessions = [];

class _ViewPrivateSessionsScreenState extends State<ViewPrivateSessionsScreen> {
  String token;
  int lastPage;
  @override
  void initState() {
    super.initState();
    token = Provider.of<User>(context, listen: false).token;
    Provider.of<PrivateSessionListViewModel>(context, listen: false)
        .fetchListPrivateSessions(token, 1)
        .then((value) {
      sessionListViewModel =
          Provider.of<PrivateSessionListViewModel>(context, listen: false);
      setState(() {
        done = true;
        privateSessions = sessionListViewModel.privateSessions;
        lastPage = sessionListViewModel.lastPage;
      });
    }).catchError((err) {
      error = true;
      print('error occured $err');
    });
  }

  getPrivateSessionsList(int page) {
    Provider.of<PrivateSessionListViewModel>(context, listen: false)
        .fetchListPrivateSessions(token, page)
        .then((value) {
      sessionListViewModel =
          Provider.of<PrivateSessionListViewModel>(context, listen: false);
      setState(() {
        done = true;
        privateSessions = sessionListViewModel.privateSessions;
        lastPage = sessionListViewModel.lastPage;
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: EdgeInsetsDirectional.all(10),
          child: Stack(children: [
            ListView(
              children: [
                SizedBox(height: 60),
                SearchBar(),
                SizedBox(height: 20),
                PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: lastPage,
                    itemBuilder: (ctx, index) {
                      if (index != 0) {
                        done = false;
                        error = false;
                        privateSessions = [];
                        getPrivateSessionsList(index + 1);
                      }
                      if (error) {
                        return Center(
                          child: Text(
                            'An error occurred',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      } else if (done && privateSessions.isEmpty) {
                        return Center(
                          child: Text(
                            'No private sessions found',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      } else if (privateSessions.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: privateSessions.length,
                            itemBuilder: (ctx, index) {
                              return myListTile(
                                privateSessions[index],
                                index,
                                token,
                              );
                            });
                      }
                    })
              ],
            ),
            CustomBackButton(),
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
            Expanded(
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             EditPrivateSessionForm(privateSession)));
                },
                child: Text(
                  'Book',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
        ));
  }
}
