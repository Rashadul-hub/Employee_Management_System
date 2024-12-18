import 'dart:convert';

import 'package:cse_department/data/models/GetUsersListModel.dart';
import 'package:cse_department/res/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/app_urls.dart';

class GetUserlists extends StatefulWidget {
  const GetUserlists({super.key});

  @override
  State<GetUserlists> createState() => _GetUserlistsState();
}

class _GetUserlistsState extends State<GetUserlists>
    with WidgetsBindingObserver {
  List<GetUsersListModel> userList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    getUsersApi();
  }

  Future<List<GetUsersListModel>> getUsersApi() async {
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
      setState(() {
        userList =
            data.map((user) => GetUsersListModel.fromJson(user)).toList();
      });

      return userList;
    } else {
      print('Request failed with status: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryMainColor,
      body: Column(
        children: [
          Expanded(
            child: userList.isEmpty ? const Center(child: CircularProgressIndicator(color: Colors.white))
                : ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                             GetUserListRow(
                                 title: 'User Name',
                                 value: userList[index].userName.toString()),
                             GetUserListRow(
                                 title: 'Designation',
                                 value:
                                     userList[index].designation.toString()),
                             GetUserListRow(
                                 title: 'Email',
                                 value: userList[index].email.toString()),
                             GetUserListRow(
                                 title: 'Contract No',
                                 value: userList[index].contactNo.toString()),
                             GetUserListRow(
                                 title: 'Extension No',
                                 value: userList[index].extension.toString()),
                           ],
                         ),
                                                  ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class GetUserListRow extends StatelessWidget {
  String title, value;
  GetUserListRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),

              )),
          Expanded(
              flex: 2,
              child: Text(
                  value,
                  textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.black87,
                ),)),
        ],
      ),
    );
  }
}
