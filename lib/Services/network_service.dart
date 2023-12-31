import 'dart:convert';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:http/http.dart';


class NetworkService {
  static final String baseUrl = "655deeb99f1e1093c59a2eda.mockapi.io";


  static final String apiUser = "/User";
  static final String apiDeleteUser = "/User";



  static Map<String, String> headers = {"Content-Type": "application/json"};

  static Future<String> getData(String api)async{
    Uri url = Uri.https(baseUrl, api);
    Response response = await get(url);
    if(response.statusCode ==200 || response.statusCode ==201){
      return response.body;
    }else{
      return "${"smth_went_wrong".tr} ${response.statusCode}";
    }
  }

  static Future<String>postData(Map<String, dynamic> body)async{
    Uri url = Uri.https(baseUrl, apiUser);

    Response response = await post(url, body: jsonEncode(body), headers: headers);

    if(response.statusCode == 200 || response.statusCode == 201){
      return "Successfully posted: ${response.body}";
    }else{
      print("object4");
      return "Something went wrong at ${response.statusCode}";
    }
  }





  static Future<String> deleteData(String id)async{
    Uri url = Uri.https(baseUrl, "$apiDeleteUser/$id");
    Response response = await delete(url, headers: headers);
    if(response.statusCode ==200 || response.statusCode ==201){
      return "${response.statusCode}";
    }else{
      return "${"smth_went_wrong".tr} ${response.statusCode}";
    }
  }
}




