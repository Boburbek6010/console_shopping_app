import 'dart:io';

import 'package:console_shopping_app/Menus/admin_menu.dart';
import 'package:console_shopping_app/Menus/main_product_menu.dart';
import 'package:console_shopping_app/Services/admin_user_list.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import '../Menus/main_menu.dart';
import '../Menus/setting_menu.dart';
import 'network_service.dart';
import 'package:console_shopping_app/Models/user.dart';

class RegisterUser extends Menu{
  static const id = "/register_menu";
  bool isNewUserCreated = false;
  String prefer = "";

  Future<void> selectMenu(String press) async{
    prefer = press;
    switch(press){
      case "1": {
        isNewUserCreated ? await Navigator.push(AdminMenu()) :await signUp();
      }
      break;
      case "2": isNewUserCreated ? await Navigator.push(AdminMenu()) :await signIn();
      break;
      case "3":{
        await Navigator.push(SettingMenu());
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("object");
    print("1. ${"sign_up".tr}");
    print("2. ${"sign_in".tr}");
    print("3. ${"setting".tr}");
    String press ="";
    do{
      IOService ioService =IOService();
      IOService.write("\x1b[32m  Tanlang =>  \t\x1b[0m".tr);
      press = stdin.readLineSync()!;
      if(press != "1" && press != "2" && press != "3"){
        print("\n");
        ioService.pBorder("\x1b[31m \t\t\t${IOService.txtBlock(" Xato kiritdingiz ")}\x1b[0m".tr);
      } else {
        break;
      }
    }while(true);
    await selectMenu(press);
  }


  // RegisterUser(){
  //   build().then((value) async {
  //     if(prefer == "1"){
  //       await signUp();
  //     }else if(prefer == "2"){
  //       await signIn();
  //     }
  //   });
  //
  // }


  Future<void> checkingPost(User user)async {
    AdminUserList.users.add(user);
    // for (var element in AdminUserList.users) {
    //
    // }
    var res = await NetworkService.postData(user.toJson());
    print(res);
    isNewUserCreated = true;
    await Navigator.push(ProductMenu());
  }

  Future<void>  signUp() async {

    String email;
    do {
      stdout.write("Enter your email: ");
      email = stdin.readLineSync() ?? "";

      if (!isValidEmail(email)) {
        print("Invalid email format. Please enter a valid email address.");
        print("""
         Hang on, do you know that how should be email address?
         If no, google it !!!
        """);
      } else if (AdminUserList.users.any((user) => user.email == email)) {
        print("Email is already registered. Please use a different email.");
      }
    } while (!isValidEmail(email) || AdminUserList.users.any((user) => user.email == email));

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
        print("Invalid name format. First letter of name should be capital letter.");
      }
    } while (!isValidName(name));

    String surname;
    do {
      stdout.write("Enter your surname: ");
      surname = stdin.readLineSync() ?? "";

      if (!isValidSurname(surname)) {
        print("Invalid surname format. First letter of surname should be capital letter.");
      }
    } while (!isValidSurname(surname));

    int age;
    do {
      stdout.write("Enter your age: ");
      String ageInput = stdin.readLineSync() ?? "";
      age = int.tryParse(ageInput) ?? 0;

      if (age <= 0) {
        print("Invalid age. Please enter a valid age.");
      } else if (age < 16) {
        print("You are too young. You must be 16 or older.");
      }
    } while (age <= 0 || age < 16);

    String phoneNumber;
    do {
      stdout.write("Enter your phone number: +998");
      phoneNumber = stdin.readLineSync() ?? "";

      if (!isValidPhoneNumber(phoneNumber)) {
        print("Invalid phone number format. You can enter only 9 digits.");
      }
    } while (!isValidPhoneNumber(phoneNumber));

    String id = '';
    User user = User(email, password, name, surname, age, phoneNumber, /*id*/);


    //print('User JSON: ${user.toJson()}');
    print("Successfully registered!");
    await checkingPost(user);

  }


  Future<void> signIn() async{

    String email;
    do {
      stdout.write("Enter your email: ");
      email = stdin.readLineSync() ?? "";

      if (!isValidEmail(email)) {
        print("Invalid email format. Please enter a valid email address.");
        print("""
        First of all, you should be register!
        """);
      }
    }while (!isValidEmail(email));

    String password;
    do {
      stdout.write("Enter your password: ");
      password = stdin.readLineSync() ?? "";

      if (!isValidPassword(password)) {
        print("Invalid password format.");
      }
    } while (!isValidPassword(password));

    User? user;
    try {
      user = AdminUserList.users.firstWhere(
            (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      user = null;
    }

    if (user != null) {
      print("Welcome, ${user.name}!");
    } else {
      print("User not found. Please register first!");
      // Yangi foydalanuvchi qo'shish logikasi
      // Sizning ro'yxatdan o'tkazish funktsiyangizni chaqiring
    }

    isNewUserCreated = true;

    //navigator pushda productga emas yangi ochiladigan bolimlarga qo'shish kerak

  }





  }




  /// When new user use our shop app. The one have to enter with sign up.



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

  ///Checking vail phone number. A valid phone number should meet the following requirements;
  bool isValidPhoneNumber(String input) {

    return RegExp(r'^\d{9}$').hasMatch(input);
  }


  ///Checking vail surname. A valid surname should meet the following requirements;
  bool isValidSurname(String name) {

    RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]{2,}$');
    return nameRegExp.hasMatch(name);
  }


  /// When old user use our shop app. The one have to enter with sign in.




// admin systemga qoshiladigan funksiyalarni shu yerdan ishlataman yani mock apidagi userlarni print delet qilish uchun




Future<void> checkingGet(User user)async {
  AdminUserList.users.add(user);
  var need  = await NetworkService.getData(NetworkService.apiUser);
  print(need);
  await Navigator.push(ProductMenu());
}

Future<void> checkingDelete(User user)async {
  AdminUserList.users.add(user);
  var need1 = await NetworkService.deleteData("2");
  print(need1);
  await Navigator.push(ProductMenu());
}



