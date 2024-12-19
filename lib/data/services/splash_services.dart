import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../routes/routes_name.dart';
import '../../view_models/userViewmodel.dart';
import '../models/user_model.dart';

class SplashServices {

  Future<UserModel> getUserData() => UserProvider().getUser();
  Future<void> checkAuthentication(BuildContext context) async {
    try {
      final userData = await getUserData();
      final token = userData.token;

      if (token != null && token.isNotEmpty) {
        _navigateAfterDelay(context, RoutesName.admin);
      } else  {
        _navigateAfterDelay(context, RoutesName.login); // Navigate to login if no token
      }
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print("Error fetching user data: $error");
        print(stackTrace);
      }
    }
  }
  void _navigateAfterDelay(BuildContext context, String routeName) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamed(context, routeName);
  }

}

