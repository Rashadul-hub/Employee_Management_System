import 'package:http/http.dart' as http;

import '../../res/app_urls.dart';
import '../network/BaseApiServices.dart';
import '../network/NetworkApiService.dart';


class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Future<dynamic> signUpApi(dynamic data) async {
  //   try {
  //     dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
  //     return response;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<void> logoutApi(String token) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(AppUrl.logOutEndPoint),
  //       headers: {'Authorization': 'Bearer $token'},
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Logout was successful
  //       // await _clearAllCaches();
  //     } else {
  //       throw Exception('Failed to logout. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }


  // Future<void> _clearAllCaches() async {
  //   List<String> cacheKeys = [
  //     'Active Client',
  //     'Previous Client',
  //     'Client DashBoard',
  //     'Clients List',
  //     'Payslip',
  //     'Staff Profile',
  //     'Client Profile',
  //     'Request List',
  //     'Request Tab',
  //     'Department Tab',
  //     'Department List',
  //     'WeekDataStaff',
  //     'WeekDetails_Staff',
  //   ];
  //
  //   for (String key in cacheKeys) {
  //     await APICacheManager().deleteCache(key);
  //     print('Cache cleared: $key'); // Print statement to show cache removal
  //   }
  // }
}