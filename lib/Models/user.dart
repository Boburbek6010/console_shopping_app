import 'dart:convert';

import 'package:console_shopping_app/Services/extention_service.dart';

List<User> userFromData(String data) =>
    List<User>.from(jsonDecode(data).map((e) => User.fromJson(e)));
String userToData(User user) => jsonEncode(user.toJson());

/// User class  need to work with mock api and save, check information

class User {
 late String email;
 late String password;
 late String name;
 late String surname;
 late int age;
 late String? phoneNumber;

  User({required this.email, required this.password,  required this.name, required this.surname, required this.age,required this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
    name = json["name"];
    surname = json["surname"];
    age = json["age"];
    phoneNumber = (json["phoneNumber"]);
  }
  Map<String, dynamic> toJson()  {
        return{
            "email": email,
            "password": password,
            "name": name,
            "surname": surname,
            "age": age,
            "phoneNumber": phoneNumber,
        };
      }
  @override
  String toString() {
    return "\nEmail: $email \nPassword: $password \nName: $name \nSurname: $surname \nAge: $age \nPhone Number: $phoneNumber ";
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.isMethod && invocation.memberName == #myCustomMethod) {
      return "error".tr;
    }
    return super.noSuchMethod(invocation);
  }
}
