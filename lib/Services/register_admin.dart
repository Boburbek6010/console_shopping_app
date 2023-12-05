import 'dart:io';
import 'package:console_shopping_app/Menus/admin_system_menu.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';


import '../Models/admin.dart';
import 'network_service.dart';

class RegisterAdmin {
  Admin admin = Admin(password: "Z7z2pjEB@", login: "mrkarimov708k@gmail.com");
  static List<Admin> admins = [Admin(login: "mrkarimov708k@gmail.com", password: "Z7z2pjEB@")];

  /// When new user use our shop app. The one have to enter with sign up.
  void signUp() async {
    String login;
    do {
      stdout.write("Enter your email: ");
      login = stdin.readLineSync() ?? "";

      if (!isValidEmail(login)) {
        print("Invalid email format. Please enter a valid email address.");
      } else if (admins.any((admin) => admin.login == login)) {
        print("Email is already registered. Please use a different email.");
      }
    } while (!isValidEmail(login) || admins.any((admin) => admin.login == login));

    String password;
    do {
      stdout.write("Enter your password: ");
      password = stdin.readLineSync() ?? "";

      if (!isValidPassword(password)) {
        print("Invalid password format. Please make sure it meets the requirements.");
      } else if (admins.any((admin) => admin.password == password)) {
        print("Password is already registered. Please use a different password.");
      }
    } while (!isValidPassword(password) || admins.any((admin) => admin.password == password));

    print("Successfully registered!");
    Admin newAdmin = Admin(login: login, password: password);
    admins.add(newAdmin);
    Navigator.push(AdminSystem());
    await NetworkService.postData(newAdmin.toJson());

  }

  /// Checking valid email. A valid mail should meet the following requirements;
  bool isValidEmail(String email) {
    RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  /// Checking valid password. A valid password should meet the following requirements;
  bool isValidPassword(String password) {
    RegExp hasUpperCase = RegExp(r'[A-Z]');
    RegExp hasLowerCase = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');

    return password.length > 8 &&
        hasUpperCase.hasMatch(password) &&
        hasLowerCase.hasMatch(password) &&
        hasDigit.hasMatch(password);
  }

  /// When old user use our shop app. The one have to enter with sign in.

  void signIn() {
  do {
    stdout.write("Elektron pochta manzilingizni kiriting: ");
    String email = stdin.readLineSync() ?? "";

    stdout.write("Parolingizni kiriting: ");
    String password = stdin.readLineSync() ?? "";

    Admin admin = admins.firstWhere(
      (admin) => admin.login == email && admin.password == password,
      orElse: () => Admin(login: '', password: ''), // Bo'sh Admin obyekti
    );

    if (admin.login.isNotEmpty) {
      print("Xush kelibsiz, ${admin.login}!");
      Navigator.push(AdminSystem());
    } else {
      print("Bunday email mavjud emas. Iltimos, qayta urinib ko'ring yoki ro'yxatdan o'ting.");
    }
  } while (admin.login.isNotEmpty); // Tsiklni davom ettirish shart
}






}
