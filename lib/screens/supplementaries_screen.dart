import 'dart:math';

import 'package:flutter/material.dart';

class SupplemenetariesScreen extends StatefulWidget {
  const SupplemenetariesScreen({Key key}) : super(key: key);

  @override
  SupplemenetariesScreenState createState() => SupplemenetariesScreenState();
}

class SupplemenetariesScreenState extends State<SupplemenetariesScreen> {
  List<Map> _supplementaries = [
    {
      'title': 'Post Workout, BCAA, Amino energy',
      'image':
          'https://sc04.alicdn.com/kf/Hbaa4388632d146c4b3ad6888fa5db42cO.jpeg',
      'price': 200,
    },
    {
      'title': 'Optimum Nutrition',
      'image':
          'https://4.imimg.com/data4/YL/LD/MY-3035579/gym-supplement-250x250.jpg',
      'price': 250,
    },
    {
      'title': 'SERIOUS MASS',
      'image':
          'https://content.optimumnutrition.com/i/on/on-serious-mass_Image_01?layer0=\$PDP_002\$&fmt=auto&img404=no-product-image&v=1&locale=en-us,en-gb,*',
      'price': 300,
    },
    {
      'title': 'PLATINUM CREATINE',
      'image':
          'https://gymsupplementscenterbangladesh.com/uploads/product/tfyu.jpg',
      'price': 110,
    },
    {
      'title': 'Muscle Mass Gainer',
      'image': 'https://m.media-amazon.com/images/I/81sqmBEv+0L._SL1500_.jpg',
      'price': 190,
    },
    {
      'title': 'NITROTECH',
      'image':
          'https://gymsupplementscenterbangladesh.com/uploads/product/nitrot11.jpg',
      'price': 230,
    },
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
                      Text(
                        "Supplements",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
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
                            'Selected ${_numberOfSelectedInstances.length} of ${_supplementaries.length}',
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
                  children: _supplementaries
                      .asMap()
                      .entries
                      .map((entry) => MyChoosingGridViewCard(
                            image: entry.value['image'],
                            title: entry.value['title'],
                            price: entry.value['price'],
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
        ],
      ),
    ));
  }
}

class MyChoosingGridViewCard extends StatefulWidget {
  MyChoosingGridViewCard({
    Key key,
    @required this.image,
    @required this.title,
    @required this.price,
    @required this.index,
    @required this.selectionMode,
    @required this.setSelectionMode,
    @required this.incrementItem,
    @required this.decrementItem,
    @required this.selectedItemsNumber,
    @required this.isSelected,
  }) : super(key: key);

  final image;
  final title;
  final price;

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
  Color mapLevelToColor(String level) {
    if (level == 'red') {
      return Colors.red;
    } else if (level == 'yellow') {
      return Colors.yellow;
    } else if (level == 'green') {
      return Colors.green;
    }
    return Colors.transparent;
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
        padding: EdgeInsets.all(5),
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
              height: widget.selectionMode ? 90 : 125,
              padding: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(imageBorderRadius),
                  topLeft: Radius.circular(imageBorderRadius),
                ),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.title,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'L.E ${widget.price}',
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
