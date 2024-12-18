
import 'package:cse_department/routes/routes_name.dart';
import 'package:cse_department/view/DrawerMenuBar.dart';
import 'package:cse_department/view/dashboard/get_userLists.dart';
import 'package:cse_department/view/dashboard/meeting_page.dart';
import 'package:cse_department/view/dashboard/notes_page.dart';
import 'package:cse_department/view/dashboard/task_page.dart';
import 'package:cse_department/view/dashboard/todo_page.dart';
import 'package:cse_department/view/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/login/login_screen.dart';
import '../../view/splash/SplashView.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      case RoutesName.admin:
        return MaterialPageRoute(builder: (BuildContext context) => const AdminDashboard());

      case RoutesName.getUserLists:
        return MaterialPageRoute(builder: (BuildContext context) => const GetUserlists());

      case RoutesName.editProfile:
         return MaterialPageRoute(builder: (BuildContext context) => const EditProfile());

      case RoutesName.meetingPage:
        return MaterialPageRoute(builder: (BuildContext context) => const MeetingPage());

      case RoutesName.taskPage:
         return MaterialPageRoute(builder: (BuildContext context) => const TaskPage());

     case RoutesName.todoPage:
             return MaterialPageRoute(builder: (BuildContext context) => const TodoPage());

     case RoutesName.notesPage:
             return MaterialPageRoute(builder: (BuildContext context) => const NotesPage());


      default:
        return _errorRoute();



    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('No route defined'),
        ),
      );
    });
  }
}
