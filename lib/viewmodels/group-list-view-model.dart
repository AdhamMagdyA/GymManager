import 'package:flutter/cupertino.dart';
import 'package:gym_project/helper/constants.dart';
import 'package:gym_project/models/group.dart';
import 'package:gym_project/services/group-webservices.dart';
import 'package:gym_project/viewmodels/groups-view-model.dart';

class GroupListViewModel with ChangeNotifier {
  List<GroupViewModel> groups = [];
  GroupViewModel group;
  LoadingStatus loadingStatus = LoadingStatus.Completed;

  Future<void> fetchGroups(String token) async {
    loadingStatus = LoadingStatus.Searching;
    List<Group> groupModels = await GroupWebService().getGroups(token);
    List<GroupViewModel> groupVMs =
        groupModels.map((group) => GroupViewModel(group: group)).toList();
    groups = groupVMs;
    loadingStatus = LoadingStatus.Completed;
    notifyListeners();
  }

  Future<void> fetchGroupDetails(int groupId, String token) async {
    loadingStatus = LoadingStatus.Searching;
    Group groupModel = await GroupWebService().getGroupDetails(groupId, token);
    group = GroupViewModel(group: groupModel);
    loadingStatus = LoadingStatus.Completed;
    notifyListeners();
  }

  Future<void> postGroup(
      Group group, List<dynamic> orderedObjects, String token) async {
    loadingStatus = LoadingStatus.Searching;
    Group groupModel =
        await GroupWebService().postGroup(group, orderedObjects, token);
    groups.add(GroupViewModel(group: groupModel));
    loadingStatus = LoadingStatus.Completed;
    notifyListeners();
  }

  Future<void> putGroup(
      Group group, List<dynamic> orderedObjects, String token) async {
    loadingStatus = LoadingStatus.Searching;
    Group groupModel =
        await GroupWebService().putGroup(group, orderedObjects, token);
    int updatedGroupIndex = groups.indexWhere((g) => g.id == group.id);
    groups.removeAt(updatedGroupIndex);
    groups.insert(updatedGroupIndex, GroupViewModel(group: group));
    loadingStatus = LoadingStatus.Completed;
    notifyListeners();
  }
}
