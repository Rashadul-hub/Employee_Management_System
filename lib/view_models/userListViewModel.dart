import 'package:cse_department/data/services/getUserLists_services.dart';
import 'package:flutter/material.dart';
import '../data/models/GetUsersListModel.dart';

class UserListProvider extends ChangeNotifier {

  List<GetUsersListModel> data = [];

  bool loading = false;

  /// Calling the services Class
  GetUserListsDataServices dataServices = GetUserListsDataServices();

  getUserListData(context) async {
    loading = true;
    data = await dataServices.getUsersListApi(context);
    loading = false;

    notifyListeners();
  }

}