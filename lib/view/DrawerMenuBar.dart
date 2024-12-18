import 'package:cse_department/res/color/app_colors.dart';
import 'package:cse_department/routes/routes_name.dart';
import 'package:cse_department/view/dashboard/get_userLists.dart';
import 'package:cse_department/view/dashboard/main_dashboard.dart';
import 'package:cse_department/view/dashboard/meeting_page.dart';
import 'package:cse_department/view/dashboard/notes_page.dart';
import 'package:cse_department/view/dashboard/obe_page.dart';
import 'package:cse_department/view/dashboard/task_page.dart';
import 'package:cse_department/view/dashboard/thesis_page.dart';
import 'package:cse_department/view/dashboard/todo_page.dart';
import 'package:cse_department/view_models/dashboardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/userViewmodel.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<DashboardViewModel>(
          builder: (context, dashboardProvider, child) {
            return Text(dashboardProvider.appBarTitle);
          },
        ),

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryMainColor,
              ),
              child: Stack(
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     GestureDetector(
                       onTap: () {
                         // Navigate back to the dashboard screen
                         Provider.of<DashboardViewModel>(context, listen: false)
                             .changeScreen(MainDashboard(), "Dashboard");
                         Navigator.pop(context); /// Close the drawer
                       },
                       child: CircleAvatar(
                         radius: 30,
                         backgroundImage: AssetImage('images/iubat_cse-logo.png'),
                       ),
                     ),
                     SizedBox(height: 10),
                     Text(
                       'Admin Name',
                       style: TextStyle(color: Colors.white, fontSize: 18),
                     ),
                   ],
                 ),
                 /// Navigate to an edit profile page
                 Positioned(
                   top: 0,
                   right: 0,
                   child:IconButton(
                     onPressed: () {
                       Navigator.pushNamed(context, RoutesName.editProfile);
                     },
                     icon: const Icon(Icons.edit, color: Colors.white),
                   ),
                 )
               ]
              ),
            ),
            ListTile(
              leading: const Icon(Icons.supervised_user_circle_sharp),
              title: const Text('Users'),
              onTap: () {
                /// navigate to get user list's Page
                Provider.of<DashboardViewModel>(context, listen: false)
                    .changeScreen(GetUserlists(), "Users");
                Navigator.pop(context);

                /// Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.meeting_room_outlined),
              title: const Text('Meeting'),
              onTap: () {
                // navigate to get Meetings Page
                Provider.of<DashboardViewModel>(context, listen: false)
                    .changeScreen(MeetingPage(), "Meetings");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.task_outlined),
              title: const Text('Tasks'),
              onTap: () {
                // navigate to get Tasks Page
                Provider.of<DashboardViewModel>(context, listen: false)
                    .changeScreen(TaskPage(), "Tasks");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist_sharp),
              title: const Text('TODO'),
              onTap: () {
                // navigate to get Todo_Page
                Provider.of<DashboardViewModel>(context, listen: false)
                    .changeScreen(TodoPage(), "TODO");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.note),
              title: const Text('Notes'),
              onTap: () {
                // navigate to get Note Page
                Provider.of<DashboardViewModel>(context, listen: false)
                    .changeScreen(NotesPage(), "Notes");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics_outlined),
              title: const Text('OBE'),
              onTap: () {
                // navigate to get OBE Page
                Provider.of<DashboardViewModel>(context, listen: false)
                    .changeScreen(ObePage(), "OBE");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_sharp),
              title: const Text('Thesis'),
              onTap: () {
                // navigate to get Thesis Page
                Provider.of<DashboardViewModel>(context, listen: false)
                    .changeScreen(ThesisPage(), "Thesis/Practicum");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Remove the user's session
                userPreferences.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
            ),
          ],
        ),
      ),
      body: Consumer<DashboardViewModel>(
          builder: (context, dashboardProvider, child) {
        return dashboardProvider.currentScreen;
      }),
    );
  }
}
