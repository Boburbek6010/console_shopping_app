import 'dart:convert';

List<Admin> userFromData(String data) =>List<Admin>.from(jsonDecode(data).map((e) => Admin.fromJson(e)));
String userToData(Admin admin) => jsonEncode(admin.toJson());


class Admin{
  late String login;
  late String password;

  Admin(this.login, this.password );

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
    return "login = $login, password = $password";
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.isMethod && invocation.memberName == #myCustomMethod) {
      return "Error";
    }
    return super.noSuchMethod(invocation);
  }

}