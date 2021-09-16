import 'package:flutter/material.dart';

class EquipmentsList extends StatefulWidget {
  const EquipmentsList({Key key}) : super(key: key);

  @override
  EquipmentsListState createState() => EquipmentsListState();
}

class EquipmentsListState extends State<EquipmentsList> {
  List<Map> _equipments = [
    {
      'name': 'Dumbbell 1',
      'description': 'description 1',
      'picture': 'assets/images/dumbbell.png',
    },
    {
      'name': 'Dumbbell 2',
      'description': 'description 1',
      'picture': 'assets/images/dumbbell.png',
    },
    {
      'name': 'Dumbbell 3',
      'description': 'description 1',
      'picture': 'assets/images/dumbbell.png',
    },
    {
      'name': 'Dumbbell 4',
      'description': 'description 1',
      'picture': 'assets/images/dumbbell.png',
    },
  ];

  bool _selectionMode = false;
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
    for (Map<int, int> selectedItem in _numberOfSelectedInstances) {
      // print(selectedItem);
      selectedItem.forEach((key, value) {
        // print(sets[key]);
        finalSelectedItems[key] = {
          ..._equipments[key],
          'value': value,
        };
      });
    }
    print(finalSelectedItems);
    // print(finalSelectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.black,
            ),
            width: double.infinity,
          ),
          Container(
            margin: EdgeInsets.only(left: 230, bottom: 20),
            width: 220,
            height: 190,
            decoration: BoxDecoration(
                color: Color(0xFFFFCE2B),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(190),
                    bottomLeft: Radius.circular(290),
                    bottomRight: Radius.circular(160),
                    topRight: Radius.circular(0))),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
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
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Text(
                              "Exercises",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          controller: TextEditingController(),
                          cursorColor: Theme.of(context).primaryColor,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                            labelText: 'Search',
                            suffixIcon: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: Icon(Icons.search),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_selectionMode)
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Selected ${_numberOfSelectedInstances.length} of ${_equipments.length}',
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
                        icon: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black.withOpacity(0.3),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              SliverPadding(
                padding: const EdgeInsets.all(26.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                  children: _equipments
                      .asMap()
                      .entries
                      .map((entry) => MyChoosingGridViewCard(
                            picture: entry.value['picture'],
                            title: entry.value['title'],
                            index: entry.key,
                            selectionMode: _selectionMode,
                            setSelectionMode: setSelectionMode,
                            incrementItem: incrementItem,
                            decrementItem: decrementItem,
                            selectedItemsNumber: selectedItemsNumber,
                            isSelected: isSelected,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
          if (_selectionMode)
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    getFinalSelectedItems();
                    Navigator.pop(context, finalSelectedItems);
                  }),
            ),
        ],
      ),
    ));
  }
}

class MyChoosingGridViewCard extends StatefulWidget {
  MyChoosingGridViewCard({
    Key key,
    @required this.picture,
    @required this.title,
    @required this.index,
    @required this.selectionMode,
    @required this.setSelectionMode,
    @required this.incrementItem,
    @required this.decrementItem,
    @required this.selectedItemsNumber,
    @required this.isSelected,
  }) : super(key: key);

  final picture;
  final title;

  final int index;
  final bool selectionMode;
  final Function setSelectionMode;
  final Function incrementItem;
  final Function decrementItem;
  final Function selectedItemsNumber;
  final Function isSelected;

  @override
  _MyChoosingGridViewCardState createState() => _MyChoosingGridViewCardState();
}

class _MyChoosingGridViewCardState extends State<MyChoosingGridViewCard> {
  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final double imageBorderRadius = widget.selectionMode ? 0 : 30;
    return GestureDetector(
      onLongPress: () {
        if (!widget.selectionMode) {
          widget.setSelectionMode(true);
          widget.incrementItem(widget.index);
        }
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0,
            ),
          ],
          color: widget.isSelected(widget.index)
              ? Colors.blue.withOpacity(0.5)
              : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if (widget.selectionMode)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => widget.incrementItem(widget.index),
                      icon: Icon(Icons.add)),
                  Text(
                    '${widget.selectedItemsNumber(widget.index)}',
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: !widget.isSelected(widget.index)
                          ? null
                          : () => widget.decrementItem(widget.index),
                      icon: Icon(Icons.remove)),
                ],
              ),
            Container(
              width: double.infinity,
              height: widget.selectionMode ? 70 : 110,
              padding: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(imageBorderRadius),
                  topLeft: Radius.circular(imageBorderRadius),
                ),
                child: Image.asset(
                  widget.picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 20,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
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




































// import 'package:flutter/material.dart';
// import 'package:gym_project/core/presentation/res/assets.dart';
// import 'package:gym_project/widget/grid_view_card.dart';

// class EquipmentList extends StatefulWidget {
//   const EquipmentList({Key key}) : super(key: key);

//   @override
//   _EquipmentListState createState() => _EquipmentListState();
// }

// class _EquipmentListState extends State<EquipmentList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: Container(
//           child: FloatingActionButton.extended(
//             onPressed: () {},
//             isExtended: false,
//             label: Icon(Icons.add),
//           ),
//           height: MediaQuery.of(context).size.height * 0.075,
//           width: MediaQuery.of(context).size.width * 0.1,
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
//         body: SafeArea(
//           child: Stack(
//             children: <Widget>[
//               //search bar
//               Container(
//                 height: 300,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(30),
//                       bottomRight: Radius.circular(30)),
//                   color: Colors.black,
//                 ),
//                 width: double.infinity,
//               ),
//               //background design
//               new Align(
//                 alignment: const Alignment(1.0, -1.0),
//                 child: Container(
//                   //  margin: EdgeInsets.only(left: 230, bottom: 20),
//                   width: 170,
//                   height: 190,
//                   decoration: BoxDecoration(
//                       color: Color(0xFFFFCE2B),
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(190),
//                           bottomLeft: Radius.circular(290),
//                           bottomRight: Radius.circular(160),
//                           topRight: Radius.circular(0))),
//                 ),
//               ),
//               //grid
//               CustomScrollView(
//                 slivers: <Widget>[
//                   SliverToBoxAdapter(
//                     child: Padding(
//                       padding: const EdgeInsets.all(26.0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text("Equipment",
//                               style: TextStyle(
//                                   fontSize: 40,
//                                   fontWeight: FontWeight.w800,
//                                   color: Colors.white)),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Material(
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
//                                     elevation: 2.0,
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     child: Icon(Icons.search),
//                                   ),
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.symmetric(
//                                       horizontal: 25, vertical: 13)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SliverPadding(
//                     padding: const EdgeInsets.all(26.0),
//                     sliver: SliverGrid.count(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10,
//                       children: <Widget>[
//                         GridViewCard(
//                           dumbbell,
//                           'Dumbbell',
//                           '',
//                           '',
//                           '',
//                           '',
//                         ),
//                         GridViewCard(
//                           treadmill,
//                           'Treadmill',
//                           '',
//                           '',
//                           '',
//                           '',
//                         ),
//                         GridViewCard(
//                           dumbbell,
//                           'Dumbbell',
//                           '',
//                           '',
//                           '',
//                           '',
//                         ),
//                         GridViewCard(
//                           treadmill,
//                           'Treadmill',
//                           '',
//                           '',
//                           '',
//                           '',
//                         ),
//                         GridViewCard(
//                           dumbbell,
//                           'Dumbbell',
//                           '',
//                           '',
//                           '',
//                           '',
//                         ),
//                         GridViewCard(
//                           treadmill,
//                           'Treadmill',
//                           '',
//                           '',
//                           '',
//                           '',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
