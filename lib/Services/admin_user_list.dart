import 'dart:io';

import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';

import '../Models/admin.dart';
import '../Models/user.dart';

class AdminUserList{
  Admin admin = Admin(password: "Z7z2pjEB@", login: "mrkarimov708k@gmail.com");
  static List<Admin> admins = [Admin(login: "mrkarimov708k@gmail.com", password: "Z7z2pjEB@")];
  static List<User> users = [];


  static void deleteUser() {
    IOService ioService = IOService();
    if (admins.isEmpty) {

      ioService.pBorder("\x1b[31m There are no registered admins to delete.\t\t\t\x1b[0m\n".tr);
      return;
    }

    printAllUserIndexed(); // Adminlarni ko'rsatish uchun

    int selectedIndex;
    do {
      ioService.pBorderstdout("\x1b[32m Enter the index of the admin to delete (0 to cancel): \t\t\x1b[0m".tr);
      String input = stdin.readLineSync() ?? "";

      if (input.toLowerCase() == '0') {
        return; // Funksiyani bekor qilish
      }
      selectedIndex = int.tryParse(input) ?? -1;

      if (selectedIndex < 1 || selectedIndex > admins.length) {
        ioService.pBorder("\x1b[31m Invalid index. Please enter a valid index or '0' to cancel.\t\t\t\x1b[0m\n".tr);
      }
    } while (selectedIndex < 1 || selectedIndex > admins.length);

    // Tanlangan adminni o'chirish
    admins.removeAt(selectedIndex - 1);

    ioService.pBorder("\x1b[32m Admin successfully deleted! \t\t\t\x1b[0m\n".tr);
  }

  static void printAllUserIndexed() {
    IOService ioService = IOService();
    print("");
    ioService.pBorder("\x1b[32m Registered Admins :  \t\t\t\x1b[0m\n".tr);
    admins.asMap().forEach((index, admin) {
      print("");
      ioService.pBorder("\x1b[32m Admin index ${index + 1} => Email: ${admin.login}, Password: ${admin.password}\x1b[0m\n".tr);
    });
  }

  static void addAdmin() {
    String login;
    do {
      IOService ioService = IOService();
      ioService.pBorderstdout("\x1b[32m\t Enter your email: \t\t\x1b[0m".tr);
      login = stdin.readLineSync() ?? "";

      if (!isValidEmail(login)) {
        ioService.pBorder("\x1b[31m Invalid email format. Please enter a valid email address.\t\t\t\x1b[0m\n".tr);
      } else if (admins.any((admin) => admin.login == login)) {
        print("Email is already registered. Please use a different email.");
        ioService.pBorder("\x1b[31m Email is already registered. Please use a different email.\t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidEmail(login) || admins.any((admin) => admin.login == login));

    String password;
    do {
      IOService ioService = IOService();

      ioService.pBorderstdout("\x1b[32m\t Enter your password: \t\t\x1b[0m".tr);
      password = stdin.readLineSync() ?? "";

      if (!isValidPassword(password)) {
        ioService.pBorder("\x1b[31m Invalid password format. Please make sure it meets the requirements.\t\t\t\x1b[0m\n".tr);
      } else if (admins.any((admin) => admin.password == password)) {
        ioService.pBorder("\x1b[31m Password is already registered. Please use a different password.\t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidPassword(password) || admins.any((admin) => admin.password == password));
     IOService  ioService = IOService();
    ioService.pBorder("\x1b[32m Successfully registered! \t\t\t\x1b[0m\n".tr);
    Admin newAdmin = Admin(login: login, password: password);
    admins.add(newAdmin);
  }

  bool isValidText(String text) {
    // Matn uzunligi 3 xarfdan katta
    bool isLengthValid = text.length > 2;

    // Matnda raqam bormi
    bool hasDigit = text.contains(RegExp(r'\d'));

    // Matnda belgi (alifbo harfi) bormi
    bool hasLetter = text.contains(RegExp(r'[a-zA-Z]'));

    // Hammasini tekshiramiz va natijani qaytaramiz
    return isLengthValid && !hasDigit && hasLetter;
  }

  static bool isValidEmail(String email) {
    RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    RegExp hasUpperCase = RegExp(r'[A-Z]');
    RegExp hasLowerCase = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');

    return password.length > 8 &&
        hasUpperCase.hasMatch(password) &&
        hasLowerCase.hasMatch(password) &&
        hasDigit.hasMatch(password);
  }

}