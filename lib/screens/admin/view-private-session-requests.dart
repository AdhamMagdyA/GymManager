import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:gym_project/screens/common/view-private-session-details.dart';
import 'package:gym_project/viewmodels/private-session-list-view-model.dart';
import 'package:gym_project/viewmodels/private-session-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class ViewPrivateSessionRequestsScreen extends StatefulWidget {
  @override
  _ViewPrivateSessionRequestsScreenState createState() =>
      _ViewPrivateSessionRequestsScreenState();
}

List<PrivateSessionViewModel> privateSessions = [];

class _ViewPrivateSessionRequestsScreenState
    extends State<ViewPrivateSessionRequestsScreen> {
  String token;
  int lastPage;

  void initState() {
    super.initState();
    token = Provider.of<User>(context, listen: false).token;
    getPrivateSessionsList(1);
    _currentPosition = 0;
  }

  double _currentPosition;
  var sessionListViewModel;
  bool done = false;
  bool error = false;

  getPrivateSessionsList(int page) {
    Provider.of<PrivateSessionListViewModel>(context, listen: false)
        .fetchListRequestedPrivateSessions(page)
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

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    const decorator = DotsDecorator(
      activeColor: Colors.amber,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sessions",
          style: TextStyle(
              color: Colors.white, fontFamily: "assets/fonts/Changa-Bold.ttf"),
        ),
        backgroundColor: Colors.black, //Color(0xff181818),
        iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: EdgeInsetsDirectional.all(10),
          child: Column(
            children: [
              SearchBar(),
              SizedBox(height: 20),
              // ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: privateSessions.length,
              //     itemBuilder: (ctx, index) {
              //       return myListTile(
              //         privateSessions[index]['title'],
              //         [
              //           privateSessions[index]['coach']['user']['name'],
              //           privateSessions[index]['members'][0]['user']['name'],
              //           formatDateTime(privateSessions[index]['datetime']),
              //         ],
              //         index,
              //       );
              //     }),
              Expanded(
                child: PageView.builder(
                    controller: PageController(),
                    onPageChanged: (index) {
                      setState(() {
                        privateSessions = [];
                        done = false;
                        error = false;
                        _currentPosition = index.toDouble();
                      });
                      getPrivateSessionsList(index + 1);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: lastPage,
                    itemBuilder: (ctx, index) {
                      print('index is $index');
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
                    }),
              ),
              if (done)
                DotsIndicator(
                  dotsCount: lastPage,
                  position: _currentPosition,
                  axis: Axis.horizontal,
                  decorator: decorator,
                  onTap: (pos) {
                    setState(() => _currentPosition = pos);
                  },
                ),
            ],
          ),
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
              builder: (context) => PrivateSessionDetailsScreen(privateSession),
            ),
          );
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
              privateSession.memberName,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ElevatedButton(
                  child: Text('Accept'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    // Navigator.pop(context, selectedPrivateSession);
                  }),
            ),
            SizedBox(height: 6),
            Expanded(
              child: ElevatedButton(
                  child: Text('Reject'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    // Navigator.pop(context, selectedPrivateSession);
                  }),
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
        child: TextField(
          controller: TextEditingController(text: 'Search...'),
          cursorColor: Theme.of(context).primaryColor,
          style: TextStyle(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
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
