import 'package:flutter/material.dart';

class SessionsScreen extends StatelessWidget {
  final TabController _controller;

  SessionsScreen(this._controller);

  @override
  Widget build(BuildContext context) {
    return new TabBarView(
      controller: _controller,
      children: <Widget>[
        Text('Hello'),
        Text('Flutter'),
      ],
    );
  }

  //   return new DefaultTabController(
  //       length: 2,
  //       child: new Scaffold(
  //           appBar: new PreferredSize(
  //         preferredSize: Size.fromHeight(kToolbarHeight),
  //         child: new Container(
  //           color: Colors.green,
  //           child: new SafeArea(
  //             child: Column(
  //               children: <Widget>[
  //                 new Expanded(child: new Container()),
  //                 new TabBar(
  //                   tabs: [new Text("Lunches"), new Text("Cart")],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       )));
  // }

  //   return new DefaultTabController(
  //     length: 3,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         flexibleSpace: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             TabBar(tabs: [
  //               new Tab(
  //                 icon: new Icon(Icons.add),
  //               ),
  //               new Tab(
  //                 icon: new Icon(Icons.directions),
  //               ),
  //               new Tab(
  //                 icon: new Icon(Icons.add),
  //               ),
  //             ])
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

// class MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'msc',
//       home: new DefaultTabController(
//         length: 2,
//         child: new Scaffold(
//           appBar: new PreferredSize(
//             preferredSize: Size.fromHeight(kToolbarHeight),
//             child: new Container(
//               color: Colors.green,
//               child: new SafeArea(
//                 child: Column(
//                   children: <Widget>[
//                     new Expanded(child: new Container()),
//                     new TabBar(
//                       tabs: [new Text("Lunches"), new Text("Cart")],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           body: new TabBarView(
//             children: <Widget>[
//               new Column(
//                 children: <Widget>[new Text("Lunches Page")],
//               ),
//               new Column(
//                 children: <Widget>[new Text("Cart Page")],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
