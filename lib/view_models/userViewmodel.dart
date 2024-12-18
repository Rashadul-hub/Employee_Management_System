 import 'package:cse_department/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';

 import 'package:shared_preferences/shared_preferences.dart';


class UserViewModel with ChangeNotifier {

  String? _token;
  String? get token => _token;


  /// Save user data (using Token)
  Future<bool> saveUser(UserModel user)async{

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', user.token.toString());
    _token = user.token;
    notifyListeners();
    return true;
  }

  /// Load Saved user data token
  Future<UserModel> getUser()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? getToken = sharedPreferences.getString('token');
    if(getToken != null && getToken.isNotEmpty){
      _token = getToken;
      notifyListeners();
      return UserModel(token: getToken);
    }else{
      return UserModel(token: '');
    }

  }


  Future<bool> remove()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    _token = null;
    notifyListeners();

    return true;
  }
}
