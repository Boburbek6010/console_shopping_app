import 'dart:io';
import 'package:console_shopping_app/Services/extention_service.dart';

import '../models/user.dart';
import 'network_service.dart';

class RegisterUser {
  List<User> users = [];


  /// When new user use our shop app. The one have to enter with sign up.
  void signUp() async {
    String email;
    do {
      stdout.write("email_enter".tr);
      email = stdin.readLineSync() ?? "";

      if (!isValidEmail(email)) {
        print("email_invalid".tr);
      } else if (users.any((user) => user.email == email)) {
        print("already_have_email".tr);
      }
    } while (!isValidEmail(email) || users.any((user) => user.email == email));

    String password;
    do {
      print("check_password".tr);
      stdout.write("enter_password".tr);
      password = stdin.readLineSync() ?? "";

      if (!isValidPassword(password)) {
        print("password_invalid".tr);
      }
    } while (!isValidPassword(password));

    String name;
    do {
      stdout.write("enter_name".tr);
      name = stdin.readLineSync() ?? "";

      if (!isValidName(name)) {
        print("invalid_name".tr);
      }
    } while (!isValidName(name));

    stdout.write("enter_surname".tr);
    String surname = stdin.readLineSync() ?? "";

    int age;
    do {
      stdout.write("enter_age".tr);
      String ageInput = stdin.readLineSync() ?? "";
      age = int.tryParse(ageInput) ?? 0;

      if (age <= 0) {
        print("invalid_age".tr);
      }
    } while (age <= 0);

    stdout.write("enter_phone".tr);
    String phoneNumber = stdin.readLineSync() ?? "";
    print("successfully_registered".tr);

    User user = User(email, password, name, surname, age, phoneNumber);
    await NetworkService.postData(user.toJson(), NetworkService.baseUrl, NetworkService.apiUser);
    users.add(user);
  }


  ///Checking vail email. A valid mail should meet the following requirements;
  bool isValidEmail(String email) {

    RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }


  ///Checking vail password. A valid password should meet the following requirements;
  bool isValidPassword(String password) {
    // Use regular expressions to validate password format
    RegExp hasUpperCase = RegExp(r'[A-Z]');
    RegExp hasLowerCase = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');

    return password.length > 8 &&
        hasUpperCase.hasMatch(password) && hasLowerCase.hasMatch(password) && hasDigit.hasMatch(password);
  }


  ///Checking vail name. A valid name should meet the following requirements;
  bool isValidName(String name) {

    RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]{2,}$');
    return nameRegExp.hasMatch(name);
  }

  /// When old user use our shop app. The one have to enter with sign in.
  void signIn() {
    stdout.write("email_enter".tr);
    String email = stdin.readLineSync() ?? "";

    stdout.write("enter_password".tr);
    String password = stdin.readLineSync() ?? "";


    User user = users.firstWhere((user) => user.email == email && user.password == password);

    print("${"welcome".tr}, ${user.name}!");

  }

}








