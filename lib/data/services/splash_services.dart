import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../routes/routes_name.dart';
import '../../view_models/userViewmodel.dart';
import '../models/user_model.dart';

class SplashServices {


  Future<UserModel> getUserData() => UserViewModel().getUser();


  void checkAuthentication(BuildContext context)async{

      getUserData().then((value)async{
        print(value.token.toString());
        if(value.token.toString() == 'null' || value.token.toString() == ''){

          await Future.delayed(Duration(seconds: 3));
          Navigator.pushNamed(context, RoutesName.login);

        }else{
          await Future.delayed(Duration(seconds: 3));
          Navigator.pushNamed(context, RoutesName.admin);

        }


      }).onError((error, stackTrack){

        if(kDebugMode){
          print(error.toString());
        }

      });




  }
}


// class SplashServices {
//   // Placeholder for a "getUserData" method
//   Future<Map<String, String>> getUserData() async {
//     await Future.delayed(Duration(milliseconds: 500));
//     // Return a dummy user data map for now
//     return {
//       'token': '', // Replace with a valid token later
//       'role': '' // Replace with 'clients', 'staff', 'admin' based on the user
//     };
//   }
//
//   // Method to check user authentication and navigate accordingly
//   void checkAuthentication(BuildContext context) async {
//     getUserData().then((value) async {
//       final String token = value['token'] ?? '';
//       final String role = value['role'] ?? '';
//
//       print('Token: $token'); // Debug output
//       print('Role: $role');
//
//       // Splash delay (simulating loading)
//       await Future.delayed(Duration(milliseconds: 1500));
//
//       // Conditional navigation logic
//       if (token.isEmpty || token == 'null') {
//         Navigator.pushNamed(context, RoutesName.login);
//       } else if (role == 'clients') {
//         Navigator.pushNamed(context, RoutesName.admin);
//       }  else {
//         // Default fallback in case of invalid role
//         Navigator.pushNamed(context, RoutesName.login);
//       }
//     }).onError((error, stackTrace) {
//       print('Error: $error'); // Debug error
//     });
//   }
// }
