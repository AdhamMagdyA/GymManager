import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/common/my_choosing_screen.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:gym_project/screens/coach/sets/edit-set.dart';
import 'package:gym_project/screens/common/view-set-details-screen.dart';

class ViewSetsScreen extends StatefulWidget {
  bool isSelectionTime = false;
  ViewSetsScreen(this.isSelectionTime);
  @override
  _ViewSetsScreenState createState() => _ViewSetsScreenState();
}

class _ViewSetsScreenState extends State<ViewSetsScreen> {
  final List<dynamic> sets = [
    {
      'title': 'Set 1',
      "description": 'Set consisting of 3 exercises, for your health!',
    },
    {
      'title': 'Set 2',
      "description": 'Set consisting of 3 exercises, for your health!',
    },
    {
      'title': 'Set 3',
      "description": 'Set consisting of 3 exercises, for your health!',
    },
    {
      'title': 'Set 4',
      "description": 'Set consisting of 3 exercises, for your health!',
    },
  ];

  bool _selectionMode = false;
  @override
  void initState() {
    super.initState();
    if (widget.isSelectionTime == true) {
      _selectionMode = true;
    }
  }

  List<Map<int, int>> _numberOfSelectedInstances = [];
  Map<int, Object> finalSelectedItems = {};

  void setSelectionMode(bool value) {
    setState(() {
      _selectionMode = value;
    });
  }

  void incrementItem(int index) {
    setState(() {
      int i = _numberOfSelectedInstances
          .indexWhere((map) => map.containsKey(index));
      if (i != -1) {
        _numberOfSelectedInstances[i][index] =
            _numberOfSelectedInstances[i][index] + 1;
      } else {
        _numberOfSelectedInstances.add({index: 1});
      }
    });
  }

  void decrementItem(int index) {
    setState(() {
      int i = _numberOfSelectedInstances
          .indexWhere((map) => map.containsKey(index));
      if (i == -1) return;
      if (_numberOfSelectedInstances[i][index] == 1) {
        _numberOfSelectedInstances.removeWhere((map) => map.containsKey(index));
      } else {
        _numberOfSelectedInstances[i][index] =
            _numberOfSelectedInstances[i][index] - 1;
      }
    });
  }

  int selectedItemsNumber(index) {
    if (!_numberOfSelectedInstances.any((map) => map.containsKey(index))) {
      return 0;
    } else {
      return _numberOfSelectedInstances
          .firstWhere((map) => map.containsKey(index))[index];
    }
  }

  bool isSelected(int index) {
    return _numberOfSelectedInstances.any((map) => map.containsKey(index));
  }

  void getFinalSelectedItems() {
    int index = 0;
    for (Map<int, int> selectedItem in _numberOfSelectedInstances) {
      // print(selectedItem);
      selectedItem.forEach((key, value) {
        // print(sets[key]);
        for (int i = 0; i < value; i++) {
          finalSelectedItems[index] = sets[key];
          index++;
        }
      });
      print(finalSelectedItems);
    }
    // print(finalSelectedItems);
  }

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        padding: EdgeInsetsDirectional.all(10),
        child: Stack(
          children: [
            Material(
              color: Colors.black,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextFormField(
                          controller: TextEditingController(),
                          cursorColor: Theme.of(context).primaryColor,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                              hintText: 'Search..',
                              suffixIcon: Material(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        )),
                  ),
                  SizedBox(height: 20),
                  if (_selectionMode)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Selected ${_numberOfSelectedInstances.length} of ${sets.length}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _selectionMode = false;
                              _numberOfSelectedInstances.clear();
                            });
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: sets.length,
                      itemBuilder: (ctx, index) {
                        return SetsListTile(
                            sets[index],
                            index,
                            _selectionMode,
                            setSelectionMode,
                            incrementItem,
                            decrementItem,
                            selectedItemsNumber,
                            isSelected,
                            'https://images.app.goo.gl/oSJrrxJh1LGFiope9',
                            widget.isSelectionTime);
                      }),
                ],
              ),
            ),
            if (_selectionMode)
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    child: Text('Submit',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    onPressed: () {
                      getFinalSelectedItems();
                      Navigator.pop(context, finalSelectedItems);
                    }),
              ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SetsListTile extends StatefulWidget {
  final Map set;
  final int index;
  final bool selectionMode;
  final Function setSelectionMode;
  final Function incrementItem;
  final Function decrementItem;
  final Function selectedItemsNumber;
  final Function isSelected;
  final String iconData;
  final bool selectionTime;

  SetsListTile(
      this.set,
      this.index,
      this.selectionMode,
      this.setSelectionMode,
      this.incrementItem,
      this.decrementItem,
      this.selectedItemsNumber,
      this.isSelected,
      this.iconData,
      this.selectionTime);
  @override
  _SetsListTileState createState() => _SetsListTileState();
}

class _SetsListTileState extends State<SetsListTile> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: widget.isSelected(widget.index)
              ? Colors.white24
              : Colors.transparent,
        ),
        child: ListTile(
          onTap: () {
            if (!widget.selectionTime) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SetDetailsScreen()));
            } else if (widget.selectionTime && !widget.selectionMode) {
              widget.setSelectionMode(true);
            }
          },
          leading: CircleAvatar(
            radius: 20,
            // child: Image.network(widget.iconData),
            child: FlutterLogo(),
          ),
          title: Text(
            widget.set['title'],
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.set['description'],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              if (widget.selectionTime && widget.selectionMode)
                TextButton(
                  child: Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetDetailsScreen(),
                        ));
                  },
                ),
            ],
          ),
          trailing: !widget.selectionTime
              ? Column(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditSetForm(widget.set)));
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditSetForm(widget.set)));
                        },
                        child: Text('Delete',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            )),
                      ),
                    ),
                  ],
                )
              : !widget.selectionMode
                  ? null
                  : Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.white,
                            ),
                            onTap: () => widget.incrementItem(widget.index),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.selectedItemsNumber(widget.index)}",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Icon(
                              Icons.remove,
                              size: 15,
                              color: Colors.white,
                            ),
                            onTap: () => widget.isSelected(widget.index)
                                ? widget.decrementItem(widget.index)
                                : null,
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gym_project/common/my_choosing_screen.dart';
// import 'package:gym_project/common/my_list_tile.dart';
// import 'package:gym_project/screens/coach/sets/edit-set.dart';
// import 'package:gym_project/screens/common/view-set-details-screen.dart';
// import 'package:gym_project/viewmodels/set-list-view-model.dart';
// import 'package:gym_project/viewmodels/set-view-model.dart';
// import 'package:provider/provider.dart';

// class ViewSetsScreen extends StatefulWidget {
//   bool isSelectionTime = false;
//   ViewSetsScreen(this.isSelectionTime);
//   @override
//   _ViewSetsScreenState createState() => _ViewSetsScreenState();
// }

// class _ViewSetsScreenState extends State<ViewSetsScreen> {
//   List<SetViewModel> _sets = [];
//   bool _selectionMode = false;
//   List<Map<int, int>> _numberOfSelectedInstances = [];
//   Map<int, Object> finalSelectedItems = {};

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Provider.of<SetListViewModel>(context, listen: false).fetchListSets();
//   }

//   void setSelectionMode(bool value) {
//     setState(() {
//       _selectionMode = value;
//       widget.isSelectionTime = value;
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
//     int index = 0;
//     for (Map<int, int> selectedItem in _numberOfSelectedInstances) {
//       // print(selectedItem);
//       selectedItem.forEach((key, value) {
//         // print(sets[key]);
//         for (int i = 0; i < value; i++) {
//           finalSelectedItems[index] = _sets[key];
//           index++;
//         }
//       });
//       print(finalSelectedItems);
//     }
//     // print(finalSelectedItems);
//   }

//   int number = 0;

//   @override
//   Widget build(BuildContext context) {
//     var setListViewModel = Provider.of<SetListViewModel>(context);
//     _sets = setListViewModel.sets;
//     print('Now sets are');
//     print(_sets);
//     return Container(
//       color: Colors.black,
//       padding: EdgeInsetsDirectional.all(10),
//       child: Stack(
//         children: [
//           Material(
//             color: Colors.black,
//             child: _sets.isEmpty
//                 ? Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   )
//                 : ListView(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(top: 60),
//                         child: Material(
//                             elevation: 5.0,
//                             borderRadius: BorderRadius.all(Radius.circular(30)),
//                             child: TextField(
//                               controller:
//                                   TextEditingController(text: 'Search...'),
//                               cursorColor: Theme.of(context).primaryColor,
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 18),
//                               decoration: InputDecoration(
//                                   suffixIcon: Material(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     child: Icon(Icons.search),
//                                   ),
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.symmetric(
//                                       horizontal: 25, vertical: 13)),
//                             )),
//                       ),
//                       SizedBox(height: 20),
//                       if (_selectionMode)
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   'Selected ${_numberOfSelectedInstances.length} of ${_sets.length}',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _selectionMode = false;
//                                   _numberOfSelectedInstances.clear();
//                                 });
//                               },
//                               icon: Icon(
//                                 Icons.close,
//                                 color: Colors.white,
//                               ),
//                             )
//                           ],
//                         ),
//                       ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: _sets.length,
//                           itemBuilder: (ctx, index) {
//                             return SetsListTile(
//                                 _sets[index],
//                                 index,
//                                 _selectionMode,
//                                 setSelectionMode,
//                                 incrementItem,
//                                 decrementItem,
//                                 selectedItemsNumber,
//                                 isSelected,
//                                 'https://images.app.goo.gl/oSJrrxJh1LGFiope9',
//                                 widget.isSelectionTime);
//                           }),
//                     ],
//                   ),
//           ),
//           if (_selectionMode)
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: ElevatedButton(
//                   child: Text('Submit'),
//                   style: ElevatedButton.styleFrom(
//                       primary: Colors.amber,
//                       onPrimary: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       )),
//                   onPressed: () {
//                     getFinalSelectedItems();
//                     Navigator.pop(context, finalSelectedItems);
//                   }),
//             ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 10,
//               left: 10,
//             ),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   height: 42,
//                   width: 42,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Icon(
//                       Icons.arrow_back,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SetsListTile extends StatefulWidget {
//   final SetViewModel set;
//   final int index;
//   final bool selectionMode;
//   final Function setSelectionMode;
//   final Function incrementItem;
//   final Function decrementItem;
//   final Function selectedItemsNumber;
//   final Function isSelected;
//   final String iconData;
//   final bool selectionTime;

//   SetsListTile(
//       this.set,
//       this.index,
//       this.selectionMode,
//       this.setSelectionMode,
//       this.incrementItem,
//       this.decrementItem,
//       this.selectedItemsNumber,
//       this.isSelected,
//       this.iconData,
//       this.selectionTime);
//   @override
//   _SetsListTileState createState() => _SetsListTileState();
// }

// class _SetsListTileState extends State<SetsListTile> {
//   int number = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsetsDirectional.only(bottom: 10),
//       decoration: BoxDecoration(
//         color: Color(0xff181818),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: widget.isSelected(widget.index)
//               ? Colors.white24
//               : Colors.transparent,
//         ),
//         child: ListTile(
//           onLongPress: () {
//             widget.setSelectionMode(true);
//           },
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MultiProvider(
//                           providers: [
//                             ChangeNotifierProvider(
//                               create: (_) => SetListViewModel(),
//                             ),
//                           ],
//                           child: SetDetailsScreen(widget.set.id),
//                         )));
//           },
//           leading: CircleAvatar(
//             radius: 20,
//             // child: Image.network(widget.iconData),
//             child: FlutterLogo(),
//           ),
//           title: Text(
//             widget.set.title,
//             style: TextStyle(color: Colors.white),
//           ),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 widget.set.description,
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               )
//             ],
//           ),
//           trailing: !widget.selectionTime
//               ? TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => EditSetForm(widget.set)));
//                   },
//                   child: Text(
//                     'Edit',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )
//               : !widget.selectionMode
//                   ? null
//                   : Column(
//                       children: [
//                         GestureDetector(
//                           child: Icon(
//                             Icons.add,
//                             size: 15,
//                             color: Colors.white,
//                           ),
//                           onTap: () => widget.incrementItem(widget.index),
//                         ),
//                         Text(
//                           "${widget.selectedItemsNumber(widget.index)}",
//                           style: TextStyle(fontSize: 12, color: Colors.white),
//                         ),
//                         GestureDetector(
//                           child: Icon(
//                             Icons.remove,
//                             size: 15,
//                             color: Colors.white,
//                           ),
//                           onTap: () => widget.isSelected(widget.index)
//                               ? widget.decrementItem(widget.index)
//                               : null,
//                         )
//                       ],
//                       mainAxisSize: MainAxisSize.min,
//                     ),
//         ),
//       ),
//     );
//   }
// }
