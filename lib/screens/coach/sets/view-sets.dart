import 'package:flutter/material.dart';
import 'package:gym_project/models/set.dart';
import 'package:gym_project/screens/coach/sets/edit-set.dart';
import 'package:gym_project/screens/common/view-set-details-screen.dart';
import 'package:gym_project/screens/common/widget-builders.dart';
import 'package:gym_project/viewmodels/set-list-view-model.dart';
import 'package:gym_project/viewmodels/set-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

class ViewSetsScreen extends StatefulWidget {
  static String viewingRouteName = 'sets/index';
  static String choosingRouteName = 'sets/choose';
  bool isSelectionTime = false;
  ViewSetsScreen(this.isSelectionTime);
  @override
  _ViewSetsScreenState createState() => _ViewSetsScreenState();
}

class _ViewSetsScreenState extends State<ViewSetsScreen> {
  List<SetViewModel> _sets = [];
  bool _selectionMode = false;
  Map<int, Map<String, Object>> oldSelectedSets = {};
  bool _argumentsLoaded = false;
  @override
  void initState() {
    super.initState();
    String token = Provider.of<User>(context, listen: false).token;
    Provider.of<SetListViewModel>(context, listen: false)
        .fetchListSets(token)
        .catchError((error) {
      viewErrorDialogBox(context, error.toString());
    });
    if (widget.isSelectionTime == true) {
      _selectionMode = true;
    }
  }

  void loadArguments() {
    oldSelectedSets = ModalRoute.of(context).settings.arguments;
    if (oldSelectedSets.isNotEmpty) {
      setState(() {
        oldSelectedSets.forEach((int setId, Map<String, Object> setData) {
          _numberOfSelectedInstances.add({setId: setData['quantity'] as int});
        });
        _selectionMode = true;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_argumentsLoaded) {
      loadArguments();
      _argumentsLoaded = true;
    }
  }

  List<Map<int, int>> _numberOfSelectedInstances = [];
  Map<int, Object> finalSelectedItems = {};

  void setSelectionMode(bool value) {
    setState(() {
      _selectionMode = value;
    });
  }

  void incrementItem(int setId) {
    setState(() {
      int i = _numberOfSelectedInstances
          .indexWhere((map) => map.containsKey(setId));
      if (i != -1) {
        _numberOfSelectedInstances[i][setId] =
            _numberOfSelectedInstances[i][setId] + 1;
      } else {
        _numberOfSelectedInstances.add({setId: 1});
      }
    });
    print(_numberOfSelectedInstances);
  }

  void decrementItem(int setId) {
    setState(() {
      int i = _numberOfSelectedInstances
          .indexWhere((map) => map.containsKey(setId));
      if (i == -1) return;
      if (_numberOfSelectedInstances[i][setId] == 1) {
        _numberOfSelectedInstances.removeWhere((map) => map.containsKey(setId));
      } else {
        _numberOfSelectedInstances[i][setId] =
            _numberOfSelectedInstances[i][setId] - 1;
      }
    });
    print(_numberOfSelectedInstances);
  }

  int selectedItemsNumber(setId) {
    if (!_numberOfSelectedInstances.any((map) => map.containsKey(setId))) {
      return 0;
    } else {
      return _numberOfSelectedInstances
          .firstWhere((map) => map.containsKey(setId))[setId];
    }
  }

  bool isSelected(int setId) {
    return _numberOfSelectedInstances.any((map) => map.containsKey(setId));
  }

  
  Map<int, Map<String, Object>> getFinalSelectedItems() {
    Map<int, Map<String, Object>> finalSelectedItems = {};
    for (Map<int, int> selectedItem in _numberOfSelectedInstances) {
      selectedItem.forEach((setId, quantity) {
        finalSelectedItems[setId] = {
          'set': _sets.firstWhere((SetViewModel set) => set.id == setId),
          'quantity': quantity
        };
      });
    }
    return finalSelectedItems;
  }

  int number = 0;

  @override
  Widget build(BuildContext context) {
    var setListViewModel = Provider.of<SetListViewModel>(context);
    _sets = setListViewModel.sets;
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
                              'Selected ${_numberOfSelectedInstances.length} of ${_sets.length}',
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
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _sets.length,
                      itemBuilder: (ctx, index) {
                        return SetsListTile(
                            _sets[index],
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
                      Navigator.pop(context, getFinalSelectedItems());
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
  final SetViewModel setVM;
  final bool selectionMode;
  final Function setSelectionMode;
  final Function incrementItem;
  final Function decrementItem;
  final Function selectedItemsNumber;
  final Function isSelected;
  final String iconData;
  final bool selectionTime;

  SetsListTile(
      this.setVM,
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

  Future<void> deleteSet(Set set) async {
    String token = Provider.of<User>(context, listen: false).token;
    try {
      await Provider.of<SetListViewModel>(context, listen: false)
          .deleteSet(set, token);
    } catch (error) {
      viewErrorDialogBox(context, error.toString());
    }
  }


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
          color: widget.isSelected(widget.setVM.id)
              ? Colors.white24
              : Colors.transparent,
        ),
        child: ListTile(
          onTap: () {
            if (!widget.selectionTime) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                create: (_) => SetListViewModel(),
                              ),
                            ],
                            child: SetDetailsScreen(widget.setVM.id),
                          )));
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
            widget.setVM.title,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.setVM.description,
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
                            builder: (context) => MultiProvider(
                                  providers: [
                                    ChangeNotifierProvider(
                                      create: (_) => SetListViewModel(),
                                    ),
                                  ],
                                  child: SetDetailsScreen(widget.setVM.id),
                                )));
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
                                      EditSetForm(widget.setVM),
                            ),
                          );
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
                        onPressed: () => deleteSet(widget.setVM.set),
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
                            onTap: () => widget.incrementItem(widget.setVM.id),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.selectedItemsNumber(widget.setVM.id)}",
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
                            onTap: () => widget.isSelected(widget.setVM.id)
                                ? widget.decrementItem(widget.setVM.id)
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
