 import 'package:cse_department/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';

 import 'package:shared_preferences/shared_preferences.dart';


class UserViewModel with ChangeNotifier {

  String? _token;
  String? get token => _token;

  UserModel ? _users;
  UserModel? get user => _users;

  /// Save user data (using Token)
  Future<bool> saveUser(UserModel user)async{
    // _users = user;

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('token', user.token.toString());

    _token = user.token.toString();
    notifyListeners();

    return true;
  }

  /// Load Saved user data token
  // Future <UserModel> loadUser() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? token = prefs.getString('token');
  //
  //   if(token != null){
  //     return UserModel(token: token);
  //   }else {
  //     return UserModel(token: '');
  //
  //   }
  //   notifyListeners();
  //
  // }

  Future<UserModel> getUser()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final String? getToken = sharedPreferences.getString('token');

    if(token != null){
      return  UserModel(
          token: getToken
      );
    }else {
      return UserModel(
          token: '',
      );
    }

    // return UserModel(
    //     token: getToken.toString()
    // );

  }


  Future<bool> remove()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');

    _users = null;
    _token = null;
    notifyListeners();

    return true;
  }
}
