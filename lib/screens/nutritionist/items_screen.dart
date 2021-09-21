import 'dart:math';

import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key key}) : super(key: key);

  @override
  ItemsScreenState createState() => ItemsScreenState();
}

class ItemsScreenState extends State<ItemsScreen> {
  List<Map> _items = [
    {
      'title': 'Apple',
      'image':
          'https://arabic.bestapples.com/wp-content/uploads/2015/10/gala-249x300.jpg',
      'calories': 40,
      'level': 'green',
      'creator': 'Amr Fatouh',
    },
    {
      'title': '250gm Chicken',
      'image':
          'https://cdn.shopify.com/s/files/1/0476/0115/6257/products/ChickenPopcorn_530x@2x.jpg?v=1618080367',
      'calories': 300,
      'level': 'red',
      'creator': 'Amr Fatouh',
    },
    {
      'title': 'Carrot',
      'image': 'https://www.owimio.com/wp-content/uploads/2021/02/carrot.jpg',
      'calories': 20,
      'level': 'green',
      'creator': 'Amr Fatouh',
    },
    {
      'title': 'Banana',
      'image': 'https://thumbs.dreamstime.com/b/ripe-bannana-13802636.jpg',
      'calories': 60,
      'level': 'green',
      'creator': 'Amr Fatouh',
    },
    {
      'title': '250gm of rice',
      'image':
          'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/06/23/0/FNK_Perfect-Long-Grain-White-Rice-H_s4x3.jpg.rend.hgtvcom.616.462.suffix/1592939598668.jpeg',
      'calories': 150,
      'level': 'red',
      'creator': 'Amr Fatouh',
    },
    {
      'title': '50gm of cheese',
      'image':
          'https://www.usdairy.com/optimize/getmedia/6ab03180-cc90-4a03-a339-13b540ecc8a5/american.jpg.jpg.aspx?format=webp',
      'calories': 80,
      'level': 'yellow',
      'creator': 'Amr Fatouh',
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
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              "Items",
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
                      Container(
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
                                horizontal: 25,
                                vertical: 13,
                              ),
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
                            'Selected ${_numberOfSelectedInstances.length} of ${_items.length}',
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
                  children: _items
                      .asMap()
                      .entries
                      .map((entry) => MyChoosingGridViewCard(
                            image: entry.value['image'],
                            title: entry.value['title'],
                            calories: entry.value['calories'],
                            level: entry.value['level'],
                            creator: entry.value['creator'],
                            index: entry.key,
                            selectionMode: _selectionMode,
                            setSelectionMode: setSelectionMode,
                            incrementItem: incrementItem,
                            decrementItem: decrementItem,
                            selectedItemsNumber: selectedItemsNumber,
                            isSelected: isSelected,
                          ))
                      .toList()
                ),
              ),
            ],
          ),
          if (_numberOfSelectedInstances.length > 0)
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFFFFCE2B)),
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
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
    @required this.calories,
    @required this.level,
    @required this.creator,
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
  final calories;
  final level;
  final creator;

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
      return Colors.red.shade800;
    } else if (level == 'yellow') {
      return Colors.yellow.shade700;
    } else if (level == 'green') {
      return Colors.green.shade800;
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
      child: LayoutBuilder(
        builder: (context, constraints) => ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              Container(
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
                      SizedBox(
                        height: constraints.maxHeight * 0.2,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () =>
                                    widget.incrementItem(widget.index),
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
                      ),
                    Container(
                      width: double.infinity,
                      height: constraints.maxHeight *
                          (widget.selectionMode ? 0.3 : 0.5),
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
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * 0.5 / 3.2,
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
                              height: constraints.maxHeight * 0.5 / 4,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Calories: ${widget.calories}',
                                  softWrap: false,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 20,
                            //   child: FittedBox(
                            //     fit: BoxFit.scaleDown,
                            //     child: RichText(
                            //         softWrap: false,
                            //         text: TextSpan(
                            //           text: 'Level: ',
                            //           style: TextStyle(
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 12,
                            //             color: Colors.black,
                            //           ),
                            //           children: [
                            //             TextSpan(
                            //               text: widget.level,
                            //               style: TextStyle(
                            //                 color: mapLevelToColor(widget.level),
                            //               ),
                            //             )
                            //           ],
                            //         )),
                            //   ),
                            // ),
                            SizedBox(
                              height: constraints.maxHeight * 0.5 / 4,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Created by:  ${widget.creator}',
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
              ClipPath(
                clipper: ClipPathClass(),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: mapLevelToColor(widget.level).withOpacity(0.8),
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.04,
                right: constraints.maxHeight * 0.04,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Container(
                    width: constraints.maxWidth * 0.15,
                    height: constraints.maxWidth * 0.15,
                    alignment: Alignment.topCenter,
                    color: Colors.transparent,
                    child: SizedBox(
                      height: constraints.maxWidth * 0.08,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          widget.level[0].toUpperCase() +
                              widget.level.substring(1),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width - size.width * 0.25, 0);
    path.lineTo(size.width - size.width * 0.15, 0);

    // var controlPoint = Offset(size.width - 1, size.height - 1);
    // var point = Offset(size.width, size.height - 30);
    // path.quadraticBezierTo(
    //   controlPoint.dx,
    //   controlPoint.dy,
    //   point.dx,
    //   point.dy,
    // );

    path.lineTo(size.width, size.width * 0.15);
    path.lineTo(size.width, size.width * 0.25);
    path.lineTo(size.width - size.width * 0.25, 0);
    // path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Stack(
//   clipBehavior: Clip.antiAlias,
//   children: [
//     Positioned(
//       bottom: 0,
//       right: 0,
//       child: Transform.rotate(
//         angle: pi / 4,
//         child: Container(
//           width: 40,
//           height: 60,
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//           ),
//         ),
//       ),
//     ),
//   ],
// ),