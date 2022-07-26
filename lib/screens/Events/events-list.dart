import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/screens/Events/events-tile.dart';


class EventListView extends StatefulWidget {
  final String title = 'Hicking Trip';
  final String price = "100\$";
  final String date = '25 Sep.';
  final String startTime = '7:00 AM';
  final String endTime = '10:00 AM';
  final String icon = '';
  

  EventListView();

  

  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> with TickerProviderStateMixin {
  
  final String role = 'admin';
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
              // border: Border.all(color: Colors.amber, width: 1),
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
              // border: Border.all(color: Colors.amber, width: 1),
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
              // border: Border.all(color: Colors.amber, width: 1),

          ),
          child: Align(
            alignment: Alignment.center,
            child: Text("Previous",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    ];
  
  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: this.role =='admin'? Container(
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, '/create-event');
            },
            isExtended: false,
            label: Icon(Icons.add),
          ),
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.1,
        ):Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        appBar: AppBar(
          title: Text("Events",style: TextStyle(color: Colors.white,fontFamily: "assets/fonts/Changa-Bold.ttf"),),
          backgroundColor:Colors.black, //Color(0xff181818),
          iconTheme: IconThemeData(color: Color(0xFFFFCE2B)),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.amberAccent),
            tabs: tabs,
            controller: _tabController,
            labelColor: Colors.black,
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
        )),
          body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              color: Colors.black,
              height: 200,
              padding: EdgeInsetsDirectional.all(10),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return EventListTile(widget.title, widget.price,
                        widget.date, widget.startTime,widget.endTime,widget.icon);
                  }),
            ),
            Center(
              child: getUpcomingEvents(),
            ),
            Center(
              child: getPreviousEvents(),
            ),
          ],
        ),
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
    return Text("All");
  
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