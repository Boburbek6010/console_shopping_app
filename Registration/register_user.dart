import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:console_shopping_app/Models/user.dart';
import 'package:console_shopping_app/Services/user_network_service.dart';


List<User> users = [];

/// When entered, operate start function which is all switch case
void start() {
  while (true) {
    print("1. Sign Up");
    print("2. Sign In");
    print("3. Exit");
    stdout.write("Enter your choice: ");
    String choice = stdin.readLineSync() ?? "";

    switch (choice) {
      case "1":
        signUp();
        break;
      case "2":
        signIn();
        break;
      case "3":
        print("Thank you for using our app...");
        exit(0);
        break;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}


/// When new user use our shop app. The one have to enter with sign up.
void signUp()async {
  stdout.write("Enter your email: ");
  String email = stdin.readLineSync() ?? "";


  if (!isValidEmail(email)) {
    print("Invalid email format. Please enter a valid email address.");
    return;
  }


  if (users.any((user) => user.email == email)) {
    print("Email is already registered. Please use a different email.");
    return;
  }

  stdout.write("Enter your password: ");
  String password = stdin.readLineSync() ?? "";


  if (!isValidPassword(password)) {
    print("Invalid password format. Please make sure it meets the requirements.");
    return;
  }

  stdout.write("Enter your name: ");
  String name = stdin.readLineSync() ?? "";


  if (!isValidName(name)) {
    print("Invalid name format. Please enter a valid name.");
    return;
  }

  stdout.write("Enter your surname: ");
  String surname = stdin.readLineSync() ?? "";

  stdout.write("Enter your age: ");
  int age = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  stdout.write("Enter your phone number: ");
  String phoneNumber = stdin.readLineSync() ?? "";
  User user = User(email, password, name, surname, age, phoneNumber);
  users.add(user);
  await postUserData1(user);

  print("Successfully registered!");
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
  //RegExp hasDigit = RegExp(r'\d');
  // RegExp hasUnderscore = RegExp(r'_');

  return password.length > 8 &&
      hasUpperCase.hasMatch(password) &&
      hasLowerCase.hasMatch(password);
  // hasDigit.hasMatch(password);
  //hasUnderscore.hasMatch(password);
}


///Checking vail name. A valid name should meet the following requirements;
bool isValidName(String name) {

  RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]{2,}$');
  return nameRegExp.hasMatch(name);
}

/// When old user use our shop app. The one have to enter with sign in.
void signIn() {
  stdout.write("Enter your email: ");
  String email = stdin.readLineSync() ?? "";

  stdout.write("Enter your password: ");
  String password = stdin.readLineSync() ?? "";


  User user = users.firstWhere((user) => user.email == email && user.password == password);

  print("Welcome, ${user.name}!");

}


///new user information Adding in Api
void addingInApi() async {


  ///User elementlarini GET qilish
  String data = await NetworkService.getUserData(NetworkService.apiUser);
  List<User> user1 = userFromData(data);
  for (var element in user1) {
    print(element);
  }


  /// User elemeentini DELETE qilish
  print("Ochirilishi kerak bo'lgan ID ni kiriting: ");
  while (true) {
    String id = stdin.readLineSync()!;
    String result = await NetworkService.deleteUserData(id);
    print(result);
    if (result != "200" && result != "201") {
      print("iltimos, to'gri mavjud bo'lgan ID ni kiriting!");
    } else {
      print("Muvoffaqiyatli o'chirildi");
    }
  }
}


/// new user information post User Data which will post in mockApi for new
Future<void> postUserData1(User user) async {
  try {
    Map<String, dynamic> json = user.toJson();
    String body = jsonEncode(json);
    Uri url = Uri.https(NetworkService.baseUrl, NetworkService.apiUser);
    Response response = await post(url, body: body, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Successfully posted: ${response.body}");
    } else {
      print("Something went wrong at ${response.statusCode}");
    }
  } catch (e) {
    print("Error posting data: $e");
  }
}






