import 'package:flutter/material.dart';
import 'package:gym_project/screens/coach/coach_profile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        color: Color(0xff181818),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Color(0xff181818),
              child: UserAccountsDrawerHeader(
                accountEmail: Text(
                  'folan@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
                accountName: Text(
                  'Folan El Folany',
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontFamily: "assets/fonts/Changa-Bold.ttf"),
                ),
                currentAccountPicture: Image.asset('images/welcome.png'),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'About us',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/about-us');
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text(
                'logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
