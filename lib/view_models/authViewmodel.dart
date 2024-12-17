import 'package:cse_department/view/dashboard/admin_dashboard.dart';
import 'package:cse_department/view/login/login_screen.dart';
import 'package:cse_department/view_models/userViewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/user_model.dart';
import '../data/repositories/auth_repository.dart';
import '../utils/toast_utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  final UserViewModel userPreference = UserViewModel();

  /// Access UserViewModel

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  bool _createLoading = false;
  bool get createLoading => _createLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  setcreateLoading(bool value) {
    _createLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      print("Response: $value"); // Debug log

      final userPreference = Provider.of<UserViewModel>(context, listen: false);

      userPreference.saveUser(
        UserModel(token: value['token'].toString()),
      );


      Utils.flushBarSuccessMessage('Login Successfully', context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => AdminDashboard()), // Redirect to login
      );
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorLoginMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  /// Check if user is already logged in when app starts
  // Future<void> checkLoginStatus(BuildContext context) async {
  //   final userPreference = Provider.of<UserViewModel>(context, listen: false);
  //   await userPreference.loadUser();
  //
  //   // Use a post-frame callback to ensure context is fully built
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (context.mounted) { // Ensure the context is still valid and mounted in the widget tree
  //       if (userPreference.user != null) {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => AdminDashboard()),
  //         );
  //       } else {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => LoginView()),
  //         );
  //       }
  //     }
  //   });
  //
  //   // if (userPreference.user != null) {
  //   //   /// If user token exists, navigate to the dashboard
  //   //   Navigator.push(
  //   //     context,
  //   //     MaterialPageRoute(
  //   //         builder: (context) => AdminDashboard()), // Redirect to login
  //   //   );
  //   // }
  // }

  // Logout functionality
  Future<void> logout(BuildContext context) async {
    final userPreference = Provider.of<UserViewModel>(context, listen: false);
    await userPreference.remove(); // Remove token from SharedPreferences

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginView()), // Redirect to login
    );
  }
}
