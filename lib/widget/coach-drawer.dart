import 'package:flutter/material.dart';

class CoachDrawer extends StatelessWidget {
  const CoachDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('Dahabit@gmail.com'),
            accountName: Text('Ahmed Abu Eldahab'),
            currentAccountPicture: Image.asset('images/welcome.png'),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'logout',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
