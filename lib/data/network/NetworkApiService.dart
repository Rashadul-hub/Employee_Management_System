



import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'BaseApiServices.dart';
import 'app_excaptions.dart';

class NetworkApiService extends BaseApiServices {


  @override
  Future getGetApiResponse(String url) async {

    dynamic responseJson ;
    try {
      final response = await https.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw FetchDataException(' No Internet Connection');
    }
    return responseJson;

  }


  @override
  Future getPostApiResponse(String url , dynamic data) async{

    dynamic responseJson ;
    try {
      Response response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        // body: data
        headers: {
          "Content-Type": "application/json", // Specify JSON content
        },
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw FetchDataException(' No Internet Connection');
    }
    return responseJson ;
  }

  dynamic returnResponse (https.Response response){
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}"); // Print full server response

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedExceptionLogin(response.body.toString());
      case 422:
        final dynamic responseBody = jsonDecode(response.body);
        final dynamic data = responseBody['data'];
        if (data != null && data is Map<String, dynamic>) {
          final List<dynamic>? emailErrors = data['email'];
        }
        throw UnauthorisedExceptionLogin("Unknown validation error occurred");

      case 500:
        throw FetchDataException(" Server error");
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(" Check your email or password");

    }
  }

}