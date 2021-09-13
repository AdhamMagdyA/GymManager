import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/common/my_choosing_screen.dart';
import 'package:gym_project/common/my_list_tile.dart';

import 'package:flutter/material.dart';

class ViewPrivateSessionsScreen extends StatefulWidget {
  @override
  _ViewPrivateSessionsScreenState createState() =>
      _ViewPrivateSessionsScreenState();
}

class _ViewPrivateSessionsScreenState extends State<ViewPrivateSessionsScreen> {
  static int whoIsSelected = -1;

  final List<dynamic> privateSessions = [
    {
      'title': 'Private Session 1',
      "description": 'Good Private Session',
      'duration': '10:45:22',
      'datetime': '2021-09-13 14:13:51',
      'price': '15.99',
    },
    {
      'title': 'Private Session 2',
      "description": 'Good Private Session',
      'duration': '06:45',
      'datetime': '2021-09-13 14:13:51',
      'price': '15.99',
    },
    {
      'title': 'Private Session 3',
      "description": 'Good Private Session',
      'duration': '05:45',
      'datetime': '2021-09-13 14:13:51',
      'price': '15.88',
    },
    {
      'title': 'Private Session 4',
      "description": 'Good Private Session',
      'duration': '02:34',
      'datetime': '2021-09-13 14:13:51',
      'price': '12.99',
    },
    {
      'title': 'Private Session 5',
      "description": 'Good Private Session',
      'duration': '02:34',
      'datetime': '2021-09-13 14:13:51',
      'price': '10.99',
    },
  ];

  String formatDuration(String duration) {
    String finalDuration = 'Duration: ';
    String hours = duration.substring(0, 2);
    if (hours != '00') {
      finalDuration += '$hours h';
    }
    String minutes = duration.substring(3, 5);
    if (minutes != '00') {
      finalDuration += ' $minutes m';
    }
    if (duration.length == 8) {
      String seconds = duration.substring(6);
      if (seconds != '00') {
        finalDuration += ' $seconds s';
      }
    }
    return finalDuration;
  }
  // void getFinalSelectedItems() {
  //   for (Map<int, int> selectedItem in _numberOfSelectedInstances) {
  //     print(selectedItem);
  //     selectedItem.forEach((key, value) {
  //       print(sets[key]);
  //       finalSelectedItems[key] = {
  //         ...sets[key],
  //         'value': value,
  //       };
  //     });
  //   }
  //   print(finalSelectedItems);
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      padding: EdgeInsetsDirectional.all(10),
      child: Stack(children: [
        ListView(
          children: [
            Material(
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
                )),
            SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true,
                itemCount: privateSessions.length,
                itemBuilder: (ctx, index) {
                  return CustomListTile(
                    privateSessions[index]['title'],
                    [
                      privateSessions[index]['datetime'],
                      formatDuration(privateSessions[index]['duration']),
                      '\$${privateSessions[index]['price']}',
                    ],
                  );
                }),
          ],
        ),
        if (whoIsSelected != -1)
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    fixedSize: Size.fromWidth(width),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
                onPressed: () {
                  // getFinalSelectedItems();
                  // Navigator.pop(context, finalSelectedItems);
                }),
          ),
      ]),
    );
  }

  Widget myListTile(
      String title, String description, String calories, int index) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: whoIsSelected == index ? Colors.white24 : Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            whoIsSelected = index;
          });
        },
        selected: whoIsSelected == index,
        minVerticalPadding: 10,
        leading: CircleAvatar(
          radius: 20,
          child: Icon(Icons.food_bank),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description,
              style: TextStyle(color: Colors.white24),
            ),
            Text(
              calories,
              style: TextStyle(color: Colors.white24),
            ),
          ],
        ),
      ),
    );
  }
}


// class ViewPrivateSessionsScreen extends StatefulWidget {
//   @override
//   _ViewPrivateSessionsScreenState createState() =>
//       _ViewPrivateSessionsScreenState();
// }

// class _ViewPrivateSessionsScreenState extends State<ViewPrivateSessionsScreen> {
//   final List<dynamic> privateSessions = [
//     {
//       'title': 'Private Session 1',
//       "description": 'Good Private Session',
//       'duration': '10:45:22',
//       'datetime': '2021-09-13 14:13:51',
//       'price': '15.99',
//     },
//     {
//       'title': 'Private Session 2',
//       "description": 'Good Private Session',
//       'duration': '06:45',
//       'datetime': '2021-09-13 14:13:51',
//       'price': '15.99',
//     },
//     {
//       'title': 'Private Session 3',
//       "description": 'Good Private Session',
//       'duration': '05:45',
//       'datetime': '2021-09-13 14:13:51',
//       'price': '15.88',
//     },
//     {
//       'title': 'Private Session 4',
//       "description": 'Good Private Session',
//       'duration': '02:34',
//       'datetime': '2021-09-13 14:13:51',
//       'price': '12.99',
//     },
//     {
//       'title': 'Private Session 5',
//       "description": 'Good Private Session',
//       'duration': '02:34',
//       'datetime': '2021-09-13 14:13:51',
//       'price': '10.99',
//     },
//   ];

//   bool _selectionMode = false;
//   List<Map<int, int>> _numberOfSelectedInstances = [];
//   Map<int, Object> finalSelectedItems = {};

//   void setSelectionMode(bool value) {
//     setState(() {
//       _selectionMode = value;
//     });
//   }

//   void incrementItem(int index) {
//     setState(() {
//       int i = _numberOfSelectedInstances
//           .indexWhere((map) => map.containsKey(index));
//       if (i != -1) {
//         _numberOfSelectedInstances[i][index] =
//             _numberOfSelectedInstances[i][index] + 1;
//       } else {
//         _numberOfSelectedInstances.add({index: 1});
//       }
//     });
//   }

//   void decrementItem(int index) {
//     setState(() {
//       int i = _numberOfSelectedInstances
//           .indexWhere((map) => map.containsKey(index));
//       if (i == -1) return;
//       if (_numberOfSelectedInstances[i][index] == 1) {
//         _numberOfSelectedInstances.removeWhere((map) => map.containsKey(index));
//       } else {
//         _numberOfSelectedInstances[i][index] =
//             _numberOfSelectedInstances[i][index] - 1;
//       }
//     });
//   }

//   int selectedItemsNumber(index) {
//     if (!_numberOfSelectedInstances.any((map) => map.containsKey(index))) {
//       return 0;
//     } else {
//       return _numberOfSelectedInstances
//           .firstWhere((map) => map.containsKey(index))[index];
//     }
//   }

//   bool isSelected(int index) {
//     return _numberOfSelectedInstances.any((map) => map.containsKey(index));
//   }

//   void getFinalSelectedItems() {
//     for (Map<int, int> selectedItem in _numberOfSelectedInstances) {
//       print(selectedItem);
//       selectedItem.forEach((key, value) {
//         print(privateSessions[key]);
//         finalSelectedItems[key] = {
//           ...privateSessions[key],
//           'value': value,
//         };
//       });
//     }
//     print(finalSelectedItems);
//   }

//   String formatDuration(String duration) {
//     String finalDuration = 'Duration: ';
//     String hours = duration.substring(0, 2);
//     if (hours != '00') {
//       finalDuration += '$hours h';
//     }
//     String minutes = duration.substring(3, 5);
//     if (minutes != '00') {
//       finalDuration += ' $minutes m';
//     }
//     if (duration.length == 8) {
//       String seconds = duration.substring(6);
//       if (seconds != '00') {
//         finalDuration += ' $seconds s';
//       }
//     }
//     return finalDuration;
//   }

//   int number = 0;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Container(
//       color: Colors.black,
//       padding: EdgeInsetsDirectional.all(10),
//       child: Stack(children: [
//         ListView(
//           children: [
//             Material(
//                 elevation: 5.0,
//                 borderRadius: BorderRadius.all(Radius.circular(30)),
//                 child: TextField(
//                   controller: TextEditingController(text: 'Search...'),
//                   cursorColor: Theme.of(context).primaryColor,
//                   style: TextStyle(color: Colors.black, fontSize: 18),
//                   decoration: InputDecoration(
//                       suffixIcon: Material(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         child: Icon(Icons.search),
//                       ),
//                       border: InputBorder.none,
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
//                 )),
//             SizedBox(height: 20),
//             if (_selectionMode)
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Selected ${_numberOfSelectedInstances.length} of ${privateSessions.length}',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         _selectionMode = false;
//                         _numberOfSelectedInstances.clear();
//                       });
//                     },
//                     icon: Icon(
//                       Icons.close,
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//             ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: privateSessions.length,
//                 itemBuilder: (ctx, index) {
//                   return MyChoosingListTile(
//                     privateSessions[index]['title'],
//                     [
//                       privateSessions[index]['datetime'],
//                       formatDuration(privateSessions[index]['duration']),
//                       '\$${privateSessions[index]['price']}',
//                     ],
//                     index,
//                     _selectionMode,
//                     setSelectionMode,
//                     incrementItem,
//                     decrementItem,
//                     selectedItemsNumber,
//                     isSelected,
//                     'https://images.app.goo.gl/oSJrrxJh1LGFiope9',
//                   );
//                 }),
//           ],
//         ),
//         if (_selectionMode)
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ElevatedButton(
//                 child: Text('Submit'),
//                 style: ElevatedButton.styleFrom(
//                     primary: Colors.amber,
//                     fixedSize: Size.fromWidth(width),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     )),
//                 onPressed: () {
//                   getFinalSelectedItems();
//                   // Navigator.pop(context, finalSelectedItems);
//                 }),
//           ),
//       ]),
//     );
//   }
// }


