import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/common/my_choosing_screen.dart';
import 'package:gym_project/common/my_list_tile.dart';

class ViewGroupsScreen extends StatefulWidget {
  @override
  _ViewGroupsScreenState createState() => _ViewGroupsScreenState();
}

class _ViewGroupsScreenState extends State<ViewGroupsScreen> {
  final List<dynamic> groups = [
    {
      'title': 'Group 1',
      "description": 'Group consisting of 3 exercises, for your health!',
    },
    {
      'title': 'Group 2',
      "description":
          'Group consisting of 3 exercises and 3 sets, for your health!',
    },
    {
      'title': 'Group 3',
      "description": 'Group consisting of 3 exercises, for your health!',
    },
    {
      'title': 'Group 4',
      "description":
          'Group consisting of 3 exercises and 2 sets, for your health!',
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
        print(groups[key]);
        finalSelectedItems[key] = {
          ...groups[key],
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
                        'Selected ${_numberOfSelectedInstances.length} of ${groups.length}',
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
                itemCount: groups.length,
                itemBuilder: (ctx, index) {
                  return MyChoosingListTile(
                    groups[index]['title'],
                    [groups[index]['description'], 'sub 2', 'sub 3'],
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
