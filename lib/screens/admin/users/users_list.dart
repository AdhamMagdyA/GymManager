import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UsersList extends StatefulWidget {
  final String title = 'Youssef Kholy';
  final String subtitle1 = 'Branch';
  final String subtitle2 = '01002003004';
  final String subtitle3 = 'Member';

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList>
    with SingleTickerProviderStateMixin {
  final length = 12;

  int number = 0;

  TabController _myTabController;

  void initState() {
    super.initState();
    _myTabController = TabController(
      vsync: this,
      length: 4,
    );
  }

  void dispose() {
    _myTabController.dispose();
    super.dispose();
  }

//return new TabBarView(
//       controller: _controller,
//       children: <Widget>[
//         ViewMyPrivateSessionsScreen(),
//         ViewBookedSessionsScreen(),
//       ],
//     );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: new Size(0, 0),
          child: Container(
            child: TabBar(
                unselectedLabelColor: Colors.amber,
                labelColor: Colors.amber,
                indicatorColor: Colors.amber,
                controller: _myTabController,
                tabs: [
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Members',
                  ),
                  Tab(
                    text: 'Coaches',
                  ),
                  Tab(
                    text: 'Nutritionists',
                  )
                ]),
          ),
        ),
      ),
      floatingActionButton:
          Provider.of<User>(context, listen: false).role == "admin"
              ? Container(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/create-user');
                    },
                    isExtended: false,
                    label: Icon(Icons.add),
                  ),
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.1,
                )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: TabBarView(
        controller: _myTabController,
        children: [
          AllScreen(),
          MembersScreen(),
          CoachesScreen(),
          NutritionistsScreen(),
        ],
      ),
    );
  }
}

class AllScreen extends StatelessWidget {
  final length = 12;
  final String title = 'Youssef Kholy';
  final String subtitle1 = 'Branch';
  final String subtitle2 = '01002003004';
  final String subtitle3 = 'Member';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: ListView(
        children: [
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: TextField(
              controller: TextEditingController(),
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(color: Colors.black, fontSize: 18),
              decoration: InputDecoration(
                  hintText: "Search...",
                  suffixIcon: Material(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(Icons.search),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/user-details');
                  },
                  child: UserTile('assets/images/user_icon.png', this.title,
                      this.subtitle1, this.subtitle2, this.subtitle3),
                );
              }),
        ],
      ),
    );
  }
}

class MembersScreen extends StatelessWidget {
  final length = 12;
  final String title = 'Youssef Kholy';
  final String subtitle1 = 'Branch';
  final String subtitle2 = '01002003004';
  final String subtitle3 = 'Member';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: ListView(
        children: [
          Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: TextEditingController(),
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Search...",
                    suffixIcon: Material(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              )),
          SizedBox(height: 20),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/user-details');
                  },
                  child: UserTile('assets/images/user_icon.png', this.title,
                      this.subtitle1, this.subtitle2, this.subtitle3),
                );
              }),
        ],
      ),
    );
  }
}

class CoachesScreen extends StatelessWidget {
  final length = 12;
  final String title = 'Youssef Kholy';
  final String subtitle1 = 'Branch';
  final String subtitle2 = '01002003004';
  final String subtitle3 = 'Member';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: ListView(
        children: [
          Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: TextEditingController(),
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Search...",
                    suffixIcon: Material(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              )),
          SizedBox(height: 20),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/user-details');
                  },
                  child: UserTile('assets/images/user_icon.png', this.title,
                      this.subtitle1, this.subtitle2, this.subtitle3),
                );
              }),
        ],
      ),
    );
  }
}

class NutritionistsScreen extends StatelessWidget {
  final length = 12;
  final String title = 'Youssef Kholy';
  final String subtitle1 = 'Branch';
  final String subtitle2 = '01002003004';
  final String subtitle3 = 'Member';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: ListView(
        children: [
          Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: TextEditingController(),
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Search...",
                    suffixIcon: Material(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              )),
          SizedBox(height: 20),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/user-details');
                  },
                  child: UserTile('assets/images/user_icon.png', this.title,
                      this.subtitle1, this.subtitle2, this.subtitle3),
                );
              }),
        ],
      ),
    );
  }
}

class UserTile extends StatefulWidget {
  final String path;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;

  UserTile(
      this.path, this.title, this.subtitle1, this.subtitle2, this.subtitle3);

  @override
  _UserTileState createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: Image.asset(widget.path),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.subtitle1,
                  style: TextStyle(color: Colors.white60),
                ),
                Text(
                  widget.subtitle2,
                  style: TextStyle(color: Colors.white60),
                ),
                Text(
                  widget.subtitle3,
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            ),
            Spacer(),
            Provider.of<User>(context, listen: false).role == "admin"
                ? ToggleWidget()
                : Container()
          ],
        ),
      ),
    );
  }
}

//still working on it
class ToggleWidget extends StatefulWidget {
  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  List<bool> selectionList = [true, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleSwitch(
        minWidth: 70.0,
        minHeight: 40,
        cornerRadius: 10.0,
        activeBgColors: [
          [Colors.green[800]],
          [Colors.red[800]]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.black12,
        inactiveFgColor: Colors.white,
        initialLabelIndex: 1,
        totalSwitches: 2,
        fontSize: 10,
        labels: ['Check in', 'Check out'],
        radiusStyle: true,
        onToggle: (index) {
          print('switched to: $index');
        },
      ),
    );
  }
}
