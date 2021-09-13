import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/screens/Events/events-tile.dart';


class EventListView extends StatefulWidget {
  final String title = 'Title';
  final String subtitle1 = 'Subtitle 1';
  final String subtitle2 = 'Subtitle 2';
  final String subtitle3 = 'Subtitle 3';
  

  EventListView();

  

  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> with TickerProviderStateMixin {
  
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _tabController = TabController(
      length: tabs.length,
      initialIndex: 0,
      vsync: this,
    );
  }
  
  TabController _tabController;

    List<Widget> tabs = [
      Tab(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.amber, width: 1),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text("All Events",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ),
      ),
      Tab(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.amber, width: 1),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text("Upcoming",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ),
      ),
      Tab(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.amber, width: 1),

          ),
          child: Align(
            alignment: Alignment.center,
            child: Text("Previous",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    ];

  List<dynamic> events = [
    {
      'name': 'Osama',
      'branch': 'Branch 1',
      "photo":
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
    },
    {
      'name': 'Abdo',
      'branch': 'Branch 2',
      "photo":
          'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
    }
  ];
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kTextTabBarHeight -10),
        child:Align(
          alignment: Alignment.center,
          child:Container(
            padding: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.amberAccent),
              tabs: tabs,
              controller: _tabController,
              labelColor: Colors.black,
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
          ),
            ),
        ),
      ),
        body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: getAllEvents(),
          ),
          Center(
            child: getUpcomingEvents(),
          ),
          Center(
            child: getPreviousEvents(),
          ),
        ],
      ),
      );
    // return Container(
    //   color: Colors.black,
    //   padding: EdgeInsetsDirectional.all(10),
    //   child: Column(
    //     children: [
    //       ListView.builder(
    //           shrinkWrap: true,
    //           itemCount: users.length,
    //           itemBuilder: (ctx, index) {
    //             return EventListTile(widget.title, widget.subtitle1,
    //                 widget.subtitle2, widget.subtitle3);
    //           }),
    //     ],
    //   ),
    // );
  }
  

  Text getAllEvents() 
  {
    return Text("ALL");
  }
  Text getUpcomingEvents() 
  {
    return Text("Upcoming");
  }
  Text getPreviousEvents() 
  {
    return Text("Previous");
  }
  
}