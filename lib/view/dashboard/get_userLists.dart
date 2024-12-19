
import 'package:cse_department/res/color/app_colors.dart';
import 'package:cse_department/view_models/userListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../reusable_components/getUserLists_row.dart';

class GetUserlists extends StatefulWidget {
  const GetUserlists({super.key});

  @override
  State<GetUserlists> createState() => _GetUserlistsState();
}

class _GetUserlistsState extends State<GetUserlists> {

  @override
  void initState() {
    super.initState();
    Provider.of<UserListProvider>(context, listen:  false).getUserListData(context);
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final snapshot =  Provider.of<UserListProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.primaryMainColor,
      body: Column(
        children: [
          Expanded(
            child: snapshot.loading || snapshot.data.isEmpty ? const Center(child: CircularProgressIndicator(color: Colors.white))
                : ListView.builder(
              itemCount: snapshot.data.length,
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
                            value: snapshot.data[index].userName.toString()),
                        GetUserListRow(
                            title: 'Designation',
                            value:
                            snapshot.data[index].designation.toString()),
                        GetUserListRow(
                            title: 'Email',
                            value: snapshot.data[index].email.toString()),
                        GetUserListRow(
                            title: 'Contract No',
                            value: snapshot.data[index].contactNo.toString()),
                        GetUserListRow(
                            title: 'Extension No',
                            value: snapshot.data[index].extension.toString()),
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
