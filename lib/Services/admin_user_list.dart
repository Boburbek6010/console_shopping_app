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
    if (users.isEmpty) {

      ioService.pBorder("\x1b[31m There are no registered users to delete.\t\t\t\x1b[0m\n".tr);
      return;
    }

    printAllUserIndexed(); // Adminlarni ko'rsatish uchun

    int selectedIndex;
    do {
      ioService.pBorderstdout("\x1b[33m Enter the index of the admin to delete (0 to cancel): \t\t\x1b[0m".tr);
      String input = stdin.readLineSync() ?? "";

      if (input.toLowerCase() == '0') {
        return; // Funksiyani bekor qilish
      }
      selectedIndex = int.tryParse(input) ?? -1;

      if (selectedIndex < 1 || selectedIndex > users.length) {
        ioService.pBorder("\x1b[31m Invalid index. Please enter a valid index or '0' to cancel.\t\t\t\x1b[0m\n".tr);
      }
    } while (selectedIndex < 1 || selectedIndex > admins.length);

    // Tanlangan adminni o'chirish
    users.removeAt(selectedIndex - 1);

    ioService.pBorder("\x1b[33m Admin successfully deleted! \t\t\t\x1b[0m\n".tr);
  }

  static void printAllUserIndexed() {
    IOService ioService = IOService();
    print("");
    ioService.pBorder("\x1b[33m Registered Users :  \t\t\t\x1b[0m\n".tr);
    users.asMap().forEach((index, user) {
      print("");
      ioService.pBorder("\x1b[33m User index ${index + 1} => Email: ${user.email}, Password: ${user.password}\x1b[0m\n".tr);
    });
  }

  static void addUser() {
       String name;
    do {
      IOService ioService = IOService();
      ioService.pBorderstdout("\x1b[33m\t Enter your name: \t\t\x1b[0m".tr);
      name = stdin.readLineSync() ?? "";

      if (!isValidName(name)) {
        ioService.pBorder("\x1b[31m Invalid name format. Please enter a valid name.\t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidName(name));

    String surname;
    do {
      IOService ioService = IOService();
      ioService.pBorderstdout("\x1b[33m\t Enter your surname: \t\t\x1b[0m".tr);
      surname = stdin.readLineSync() ?? "";

      if (!isValidSurname(surname)) {
        ioService.pBorder("\x1b[31m Invalid surname format. Please enter a valid surname.\t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidSurname(surname));

    String email;
    do {
      IOService ioService = IOService();
      ioService.pBorderstdout("\x1b[33m\t Enter your email: \t\t\x1b[0m".tr);
      email = stdin.readLineSync() ?? "";

      if (!isValidEmail(email)) {
        ioService.pBorder("\x1b[31m Invalid email format. Please enter a valid email address.\t\t\t\x1b[0m\n".tr);
      } else if (users.any((user) => user.email == email)) {
        ioService.pBorder("\x1b[31m Email is already registered. Please use a different email.\t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidEmail(email) || users.any((user) => user.email == email));

    String password;
    do {
      IOService ioService = IOService();

      ioService.pBorderstdout("\x1b[33m\t Enter your password: \t\t\x1b[0m".tr);
      password = stdin.readLineSync() ?? "";

      if (!isValidPassword(password)) {
        ioService.pBorder("\x1b[31m Invalid password format. Please make sure it meets the requirements.\t\t\t\x1b[0m\n".tr);
      } else if (users.any((user) => user.password == password)) {
        ioService.pBorder("\x1b[31m Password is already registered. Please use a different password.\t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidPassword(password) || admins.any((admin) => admin.password == password));

    String age;
    do {
      IOService ioService = IOService();
      ioService.pBorderstdout("\x1b[33m\t Enter your age: \t\t\x1b[0m".tr);
      age = stdin.readLineSync() ?? "";

      if (!isValidAge(age)) {
        ioService.pBorder("\x1b[31m Invalid age format. Please enter a valid age (must be greater than 16).\t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidAge(age));

    String phoneNumber;
    do {
      IOService ioService = IOService();
      ioService.pBorderstdout("\x1b[33m\t Enter your phone number: \t\t\x1b[0m".tr);
      phoneNumber = stdin.readLineSync() ?? "";

      if (!isValidPhoneNumber(phoneNumber)) {
        ioService.pBorder("\x1b[31m Invalid phone number format. Please enter a valid 9-digit number.\t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidPhoneNumber(phoneNumber));


    IOService ioService = IOService();
    ioService.pBorder("\x1b[33m Successfully registered! \t\t\t\x1b[0m\n".tr);


    User newUser = User(email: email, password: password, name: name, surname: surname, age: int.parse(age), phoneNumber: phoneNumber);
    users.add(newUser);
  }


  static bool isValidText(String text) {
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

 static bool isValidName(String name) {
    return name.isNotEmpty && name.length > 3 && name[0] == name[0].toUpperCase();
  }

 static bool isValidSurname(String surname) {
    return surname.isNotEmpty && surname.length > 3 && surname[0] == surname[0].toUpperCase();
  }

 static bool isValidAge(String age) {
    int? parsedAge = int.tryParse(age);
    return parsedAge != null && parsedAge > 16;
  }

 static bool isValidPhoneNumber(String phoneNumber) {
    return phoneNumber.length == 9 && int.tryParse(phoneNumber) != null;
  }


}