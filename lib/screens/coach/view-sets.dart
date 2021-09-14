import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/common/my_choosing_screen.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:gym_project/screens/common/view-set-details-screen.dart';

class ViewSetsScreen extends StatefulWidget {
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
      print(selectedItem);
      selectedItem.forEach((key, value) {
        print(sets[key]);
        finalSelectedItems[key] = {
          ...sets[key],
          'value': value,
        };
      });
    }
    print(finalSelectedItems);
  }

  int number = 0;

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
                    sets[index]['title'],
                    [sets[index]['description'], 'sub 2', 'sub 3'],
                    index,
                    _selectionMode,
                    setSelectionMode,
                    incrementItem,
                    decrementItem,
                    selectedItemsNumber,
                    isSelected,
                    'https://images.app.goo.gl/oSJrrxJh1LGFiope9',
                  );
                }),
          ],
        ),
        if (_selectionMode)
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
                  getFinalSelectedItems();
                  // Navigator.pop(context, finalSelectedItems);
                }),
          ),
      ]),
    );
  }
}

class SetsListTile extends StatefulWidget {
  final String title;
  final List<String> subtitles;
  final int index;
  final bool selectionMode;
  final Function setSelectionMode;
  final Function incrementItem;
  final Function decrementItem;
  final Function selectedItemsNumber;
  final Function isSelected;
  final String iconData;

  SetsListTile(
    this.title,
    this.subtitles,
    this.index,
    this.selectionMode,
    this.setSelectionMode,
    this.incrementItem,
    this.decrementItem,
    this.selectedItemsNumber,
    this.isSelected,
    this.iconData,
  );
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
          onLongPress: () {
            widget.setSelectionMode(true);
          },
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SetDetailsScreen()));
          },
          leading: CircleAvatar(
            radius: 20,
            // child: Image.network(widget.iconData),
            child: FlutterLogo(),
          ),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (String subtitle in widget.subtitles)
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
            ],
          ),
          trailing: !widget.selectionMode
              ? null
              : Column(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
                      onTap: () => widget.incrementItem(widget.index),
                    ),
                    Text(
                      "${widget.selectedItemsNumber(widget.index)}",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.remove,
                        size: 15,
                        color: Colors.white,
                      ),
                      onTap: () => widget.isSelected(widget.index)
                          ? widget.decrementItem(widget.index)
                          : null,
                    )
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
        ),
      ),
    );
  }
}
