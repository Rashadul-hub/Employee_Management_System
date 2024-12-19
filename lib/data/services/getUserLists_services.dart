import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../res/app_urls.dart';
import '../models/GetUsersListModel.dart';
import 'package:http/http.dart' as http;



class GetUserListsDataServices{

   Future<List<GetUsersListModel>> getUsersListApi(context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _token = prefs.getString('token') ?? '';
    final String apiUrl = '${AppUrl.baseUrl}/api/user/get-users';
    print("Token: $_token");

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      print('API Response: ${response.body}');

      /// Map the response to the GetUsersListModel list
      final List<dynamic> data = json.decode(response.body);
      return data.map((user) => GetUsersListModel.fromJson(user)).toList();

    } else {
      print('Request failed with status: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }

}