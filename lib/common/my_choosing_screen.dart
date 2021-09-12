import 'package:flutter/material.dart';

import 'my_list_tile.dart';

class MyChoosingScreen extends StatefulWidget {
  const MyChoosingScreen({Key key}) : super(key: key);

  @override
  _MyChoosingScreenState createState() => _MyChoosingScreenState();
}

class _MyChoosingScreenState extends State<MyChoosingScreen> {
  final List<dynamic> users = [
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

  bool _selectionMode = false;
  List<Map<int, int>> _numberOfSelectedInstances = [];

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

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (_selectionMode)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Selected ${_numberOfSelectedInstances.length} of ${users.length}',
                      style: TextStyle(color: Colors.black),
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
                  icon: Icon(Icons.close),
                )
              ],
            ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (ctx, index) {
                return Container(
                  color: (_numberOfSelectedInstances
                          .any((map) => map.containsKey(index)))
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.transparent,
                  child: MyChoosingListTile(
                    'Main Title',
                    'Subtitle 1',
                    'Subtitle 2',
                    'Subtitle 3',
                    index,
                    _selectionMode,
                    setSelectionMode,
                    incrementItem,
                    decrementItem,
                    selectedItemsNumber,
                    isSelected,
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class MyChoosingListTile extends StatefulWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final int index;
  final bool selectionMode;
  final Function setSelectionMode;
  final Function incrementItem;
  final Function decrementItem;
  final Function selectedItemsNumber;
  final Function isSelected;

  MyChoosingListTile(
    this.title,
    this.subtitle1,
    this.subtitle2,
    this.subtitle3,
    this.index,
    this.selectionMode,
    this.setSelectionMode,
    this.incrementItem,
    this.decrementItem,
    this.selectedItemsNumber,
    this.isSelected,
  );
  @override
  _MyChoosingListTileState createState() => _MyChoosingListTileState();
}

class _MyChoosingListTileState extends State<MyChoosingListTile> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        widget.setSelectionMode(true);
      },
      leading: CircleAvatar(
        radius: 20,
        child: FlutterLogo(),
      ),
      title: Text(widget.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.subtitle1,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          Text(widget.subtitle2),
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
                  ),
                  onTap: () => widget.incrementItem(widget.index),
                ),
                Text(
                  "${widget.selectedItemsNumber(widget.index)}",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.remove,
                    size: 15,
                  ),
                  onTap: () => widget.isSelected(widget.index)
                      ? widget.decrementItem(widget.index)
                      : null,
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
    );
  }
}
