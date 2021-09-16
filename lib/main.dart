import 'package:flutter/material.dart';
import 'package:gym_project/screens/Events/event-details.dart';
import 'package:gym_project/screens/Events/events-list.dart';
import 'package:gym_project/screens/Feedbacks/feedback-form.dart';
import 'package:gym_project/screens/Invitations/invitation-form.dart';
import 'package:gym_project/screens/Invitations/invitation-list.dart';
import 'package:gym_project/screens/Supplements/supplement-grid-view.dart';
import 'package:gym_project/screens/admin/home.dart';
import 'package:gym_project/screens/coach/coach-tabs-screen.dart';
import 'package:gym_project/screens/common/grid_view.dart';
import 'package:gym_project/screens/common/login-screen.dart';
import 'package:gym_project/screens/common/tabs-screen.dart';
import 'package:gym_project/screens/admin/util-screen.dart';
import 'package:gym_project/screens/coach/coach-tabs-screen.dart';
import 'package:gym_project/screens/items_screen.dart';
import 'package:gym_project/screens/my_choosing_gridview_screen.dart';
import 'package:gym_project/screens/member/training-mode/training_mode_exercise_screen.dart';
import 'package:gym_project/screens/member/training-mode/training_mode_overview_screen.dart';
import 'package:gym_project/screens/nutritionist/util-screen.dart';

import 'screens/common/ProfilePage.dart';
import 'screens/member/home-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym',
      theme: ThemeData(
          primaryColor: Color(0xFFFFCE2B),
          //primaryColor: Color(0xff0082CD),
          //primaryColorDark: Color(0xff0082CD),
          accentColor: Color(0xFFFFCE2B),
          scaffoldBackgroundColor: Colors.black,
          canvasColor: Colors.white,
          fontFamily: "ProximaNova",
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            headline3: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white),
            headline5: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => CoachTabsScreen(),
        '/events': (context) => EventListView(),
        '/supplements': (context) => SupplementList(),
        '/invite': (context) => InvitationForm(),
        '/feedback': (context) => FeedbackForm(),
        '/invitations': (context) => InvitationList(),
        // '/event': (context) => EventDetailsScreen(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
