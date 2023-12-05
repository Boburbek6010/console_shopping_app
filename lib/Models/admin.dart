import 'dart:convert';
import 'package:console_shopping_app/Services/extention_service.dart';

List<Admin> userFromData(String data) =>List<Admin>.from(jsonDecode(data).map((e) => Admin.fromJson(e)));
String userToData(Admin admin) => jsonEncode(admin.toJson());


class Admin{
  late String login;
  late String password;

Admin({required this.password, required this.login});
  Admin.fromJson(Map<String, dynamic>json){
    login = json["login"];
    password = json["password"];
  }

  Map<String, dynamic>toJson(){
    Map<String, dynamic> map = {
      "login":login,
      "password":password,
    };
    return map;
  }

  @override
  String toString() {
    //"1. ${"admin".tr}"
    return "${"login".tr}  $login, ${"password".tr} $password";
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.isMethod && invocation.memberName == #myCustomMethod) {
      return "error".tr;
    }
    return super.noSuchMethod(invocation);
  }

}