import 'package:flutter/material.dart';
import 'package:gym_project/common/my_list_tile_without_counter.dart';

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
      floatingActionButton: Container(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/create-user');
          },
          isExtended: false,
          label: Icon(Icons.add),
        ),
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.1,
      ),
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
                  child: CustomListTileWithoutCounter(
                      'assets/images/user_icon.png',
                      this.title,
                      this.subtitle1,
                      this.subtitle2,
                      this.subtitle3),
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
                  child: CustomListTileWithoutCounter(
                      'assets/images/user_icon.png',
                      this.title,
                      this.subtitle1,
                      this.subtitle2,
                      this.subtitle3),
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
                  child: CustomListTileWithoutCounter(
                      'assets/images/user_icon.png',
                      this.title,
                      this.subtitle1,
                      this.subtitle2,
                      this.subtitle3),
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
                  child: CustomListTileWithoutCounter(
                      'assets/images/user_icon.png',
                      this.title,
                      this.subtitle1,
                      this.subtitle2,
                      this.subtitle3),
                );
              }),
        ],
      ),
    );
  }
}
