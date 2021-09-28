import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_project/common/my_choosing_screen.dart';
import 'package:gym_project/common/my_list_tile.dart';
import 'package:gym_project/helper/constants.dart';
import 'package:gym_project/models/group.dart';
import 'package:gym_project/screens/common/view-group-details-screen.dart';
import 'package:gym_project/screens/common/view-set-details-screen.dart';
import 'package:gym_project/services/group-webservices.dart';
import 'package:gym_project/services/set-webservice.dart';
import 'package:gym_project/viewmodels/group-list-view-model.dart';
import 'package:gym_project/viewmodels/groups-view-model.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';

import 'edit-group.dart';

class ViewGroupsScreen extends StatefulWidget {
  bool isSelectionTime = false;

  ViewGroupsScreen(this.isSelectionTime);
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
  @override
  void initState() {
    super.initState();
    if (widget.isSelectionTime == true) {
      _selectionMode = true;
    }
    String token = Provider.of<User>(context, listen: false).token;
    Provider.of<GroupListViewModel>(context, listen: false).fetchGroups(token);

    Group group = Group.detailsFromJson(
      json.decode(
        '{ "id": 1, "description": "Veritatis qui deleniti tenetur aut. Sequi aliquam pariatur autem sed cupiditate reiciendis.", "title": "flutter group 1", "coach_id": 5, "created_at": "2021-09-25 14:56:43", "updated_at": "2021-09-25 14:56:43", "exercises": [ { "id": 18, "description": "Tenetur ut velit cum quibusdam. Voluptatem distinctio ea pariatur quibusdam. Officiis dignissimos repudiandae non perferendis iure. Similique qui tempora nihil explicabo.", "duration": "05:42", "gif": "http://www.daniel.com/cumque-velit-dolorem-eum-eius-omnis-ducimus", "cal_burnt": 0.12, "title": "nemo", "reps": 2, "image": "https://via.placeholder.com/640x480.png/001177?text=qui", "coach_id": 5, "created_at": "2021-09-25 14:56:42", "updated_at": "2021-09-25 14:56:42", "pivot": { "group_id": 1, "exercise_id": 18, "created_at": "2021-09-25 14:56:47", "updated_at": "2021-09-25 14:56:47", "break_duration": "01:00" } }, { "id": 20, "description": "Necessitatibus eius dolores voluptatem eos. Cumque velit voluptatem possimus aliquid. Deserunt delectus odit reiciendis eum modi iure. Omnis est sunt aut recusandae sequi nemo iure.", "duration": "12:59", "gif": "https://okon.org/quia-voluptatum-quasi-sit-enim.html", "cal_burnt": 39.7, "title": "aliquid", "reps": 8, "image": "https://via.placeholder.com/640x480.png/00aaaa?text=tempora", "coach_id": 5, "created_at": "2021-09-25 14:56:42", "updated_at": "2021-09-25 14:56:42", "pivot": { "group_id": 1, "exercise_id": 20, "created_at": "2021-09-25 14:56:47", "updated_at": "2021-09-25 14:56:47", "break_duration": "01:00" } } ], "sets": [ { "id": 13, "title": "ipsum", "description": "Odio eum sit recusandae et eos officiis et ipsa. Nemo et consequatur eligendi minima ut. Illo similique sapiente nesciunt ducimus minus.", "coach_id": 5, "created_at": "2021-09-25 14:56:42", "updated_at": "2021-09-25 14:56:42", "pivot": { "group_id": 1, "set_id": 13, "created_at": "2021-09-25 14:56:47", "updated_at": "2021-09-25 14:56:47", "break_duration": "1 hour" }, "exercises": [] } ] }',
      ),
    );
    Provider.of<GroupListViewModel>(context, listen: false)
        .postGroup(group, token);
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
    GroupListViewModel groupListVM = Provider.of<GroupListViewModel>(context);
    List<GroupViewModel> groupVMs = groupListVM.groups;
    double width = MediaQuery.of(context).size.width;
    
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

                  if (groupListVM.loadingStatus == LoadingStatus.Searching)
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  if (groupListVM.loadingStatus == LoadingStatus.Completed)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: groupVMs.length,
                      itemBuilder: (ctx, index) {
                        return GroupsListTile(
                          groupVMs[index],
                          index,
                          _selectionMode,
                          setSelectionMode,
                          incrementItem,
                          decrementItem,
                          selectedItemsNumber,
                          isSelected,
                          'https://images.app.goo.gl/oSJrrxJh1LGFiope9',
                          widget.isSelectionTime,
                        );
                      },
                    ),
                ],
              ),
            ),
            if (_selectionMode)
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        onPrimary: Colors.black,
                        fixedSize: Size.fromWidth(width),
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

class GroupsListTile extends StatefulWidget {
  final GroupViewModel groupVM;
  final int index;
  final bool selectionMode;
  final Function setSelectionMode;
  final Function incrementItem;
  final Function decrementItem;
  final Function selectedItemsNumber;
  final Function isSelected;
  final String iconData;
  final bool selectionTime;
  GroupsListTile(
    this.groupVM,
    this.index,
    this.selectionMode,
    this.setSelectionMode,
    this.incrementItem,
    this.decrementItem,
    this.selectedItemsNumber,
    this.isSelected,
    this.iconData,
    this.selectionTime,
  );
  @override
  _GroupsListTileState createState() => _GroupsListTileState();
}

class _GroupsListTileState extends State<GroupsListTile> {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroupDetailsScreen(widget.groupVM.id),
                ),
              );
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
            widget.groupVM.title,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.groupVM.description,
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
                          builder: (context) =>
                              GroupDetailsScreen(widget.groupVM.id),
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             EditGroupForm(widget.groupVM)));
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             EditGroupForm(widget.groupVM)));
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
