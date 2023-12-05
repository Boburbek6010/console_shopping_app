import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  late  String email;
  late  String password;
  late  String name;
  late  String surname;
  late  int age;
  late  String phoneNumber;
  late  String id;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    required this.age,
    required this.phoneNumber,
    required this.id,
  });

  User.fromJson(Map<String, dynamic> json){
    email = json["email"];
    password = json["password"];
    name = json["name"];
    surname = json["surname"];
    age = json["age"];
    phoneNumber = json["phoneNumber"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "name": name,
    "surname": surname,
    "age": age,
    "phoneNumber": phoneNumber,
    "id": id,
  };
}
