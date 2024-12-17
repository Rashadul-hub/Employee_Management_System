import 'package:cse_department/view/dashboard/admin_dashboard.dart';
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

  bool _loading = false ;
  bool get loading => _loading ;

  bool _signUpLoading = false ;
  bool get signUpLoading => _signUpLoading ;

  bool _createLoading = false ;
  bool get createLoading => _createLoading ;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  setcreateLoading(bool value){
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
        UserModel(
            token: value['token'].toString()

        ),
      );

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminDashboard()), (route) => false,);
      Utils.flushBarSuccessMessage('Login Successfully', context);

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

}