import 'dart:io';
import 'package:console_shopping_app/Services/navigation_service.dart';

import '../Menus/main_product_menu.dart';
import '../models/user.dart';
import 'network_service.dart';

class RegisterUser {
  static List<User> users = [];


  /// When new user use our shop app. The one have to enter with sign up.
  void signUp() async {
    String email;
    do {
      stdout.write("Enter your email: ");
      email = stdin.readLineSync() ?? "";

      if (!isValidEmail(email)) {
        print("Invalid email format. Please enter a valid email address.");
      } else if (users.any((user) => user.email == email)) {
        print("Email is already registered. Please use a different email.");
      }
    } while (!isValidEmail(email) || users.any((user) => user.email == email));

    String password;
    do {
      print("""
      Password requirements:
      - Have more than 8 characters.
      - Contains a capital letter.
      - Contains a lowercase letter.
      - Contains a number.
    """);
      stdout.write("Enter your password: ");
      password = stdin.readLineSync() ?? "";

      if (!isValidPassword(password)) {
        print("Invalid password format. Please make sure it meets the requirements.");
      }
    } while (!isValidPassword(password));

    String name;
    do {
      stdout.write("Enter your name: ");
      name = stdin.readLineSync() ?? "";

      if (!isValidName(name)) {
        print("Invalid name format. Please enter a valid name.");
      }
    } while (!isValidName(name));

    String surname;
    do {
      stdout.write("Enter your surname: ");
      surname = stdin.readLineSync() ?? "";
      if (!isValidName(surname)) {
        print("Invalid surname format. Please enter a valid surname.");
      }
    }while(!isValidSurname(surname));

    int age;
    do {
      stdout.write("Enter your age: ");
      String ageInput = stdin.readLineSync() ?? "";
      age = int.tryParse(ageInput) ?? 0;
      if (age <= 0) {
        print("Invalid age. Please enter a valid age.");
      }else if(age <=16 || age>=0){
        print("You are too young. You cannot use this app.");
      }
    } while (age <= 0);

    String phoneNumber;
    do {
      stdout.write("Enter your phone number: +998");
       phoneNumber = stdin.readLineSync() ?? "";
      if (!isValidPhoneNumber(phoneNumber)) {
        print("You have to enter 9 digits");
      }
    }while(!isValidPhoneNumber(phoneNumber));
    print("Successfully registered!");

    User user = User(email, password, name, surname, age, phoneNumber);
    users.add(user);
    await Navigator.push(ProductMenu());
    await NetworkService.postData(user.toJson(), NetworkService.baseUrl, NetworkService.apiUser);
  }


  ///Checking vail email. A valid mail should meet the following requirements;
  bool isValidEmail(String email) {

    RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  ///Checking vail password. A valid password should meet the following requirements;
  bool isValidPassword(String password) {
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

  ///Checking vail surname. A valid surname should meet the following requirements;
  bool isValidSurname(String name) {

    RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]{2,}$');
    return nameRegExp.hasMatch(name);
  }

  ///Checking vail phoneNumber. A valid phoneNumber should meet the following requirements;
  bool isValidPhoneNumber(String phoneNumber) {
    return phoneNumber.length == 9;
  }

  /// When old user use our shop app. The one have to enter with sign in.
  Future<void> signIn() async {
    stdout.write("Enter your email: ");
    String email = stdin.readLineSync() ?? "";

    stdout.write("Enter your password: ");
    String password = stdin.readLineSync() ?? "";


    User user = users.firstWhere((user) => user.email == email && user.password == password);

    print("Welcome, ${user.name}!");
    await Navigator.push(ProductMenu());

  }

}








