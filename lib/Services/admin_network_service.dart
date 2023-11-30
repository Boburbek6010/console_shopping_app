import 'dart:convert';

import 'package:http/http.dart';

/// admin uchun network servis base url api bilan ulash
class NetworkService {
  static final String baseUrl = "6565cdd7eb8bb4b70ef26025.mockapi.io";

  static final String apiUser = "/admin";
  static final String apiDeleteUser = "/admin";


  static Map<String, String> headers = {"Content-Type": 'application/json'};

  /// get User data from mock api
  static Future<String> getAdminData(String api)async{
    Uri url = Uri.https(baseUrl, api);
    Response response = await get(url);
    if(response.statusCode ==200 || response.statusCode ==201){
      return response.body;
    }else{
      return "Something went wrong at ${response.statusCode}";
    }
  }

  /// post User data to mock api
  static Future<String> postAdminData(Map<String, dynamic> body)async{
    Uri url = Uri.https(NetworkService.baseUrl, NetworkService.apiDeleteUser);
    Response response = await post(url, body: jsonEncode(body), headers: headers);
    if(response.statusCode ==200 || response.statusCode ==201){
      return "Successfully posted: ${response.body}";
    }else{
      return "Something went wrong at ${response.statusCode}";
    }
  }

  ///delete user data from mock api
  static Future<String> deleteAdminData(String id)async{
    Uri url = Uri.https(baseUrl, "$apiDeleteUser/$id");
    Response response = await delete(url, headers: headers);
    if(response.statusCode ==200 || response.statusCode ==201){
      return "${response.statusCode}";
    }else{
      return "Something went wrong at ${response.statusCode}";
    }
  }
}




