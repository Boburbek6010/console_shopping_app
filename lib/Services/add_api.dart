import 'dart:io';
import 'package:console_shopping_app/Menus/home_menu.dart';
import 'package:console_shopping_app/Services/admin_user_list.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'package:console_shopping_app/Services/register_user.dart';
import '../Menus/admin_system_menu.dart';
import '../Menus/main_menu.dart';
import 'network_service.dart';
import 'package:console_shopping_app/Models/user.dart';

class PostApi extends Menu{
  static const id = "/postuser_menu";

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1": {
        await Navigator.push(RegisterUser());
      }
      break;
      case "2": await Navigator.push(HomeMenu());
      break;
      case "3":{
         exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build() async{
    print("1. ${"kirish".tr}");
    print("2. ${"Bosh menu".tr}");
    print("3. ${"chiqish".tr}");
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
}


/// When new user use our shop app. The one have to enter with sign up.
Future<void>  adding() async {

  // String email;
  // do {
  //   stdout.write("Enter your email: ");
  //   email = stdin.readLineSync() ?? "";
  //
  //   if (!isValidEmail(email)) {
  //     print("Invalid email format. Please enter a valid email address.");
  //     print("""
  //        Hang on, do you know that how should be email address?
  //        If no, google it !!!
  //       """);
  //   } else if (AdminUserList.users.any((user) => user.email == email)) {
  //     print("Email is already registered. Please use a different email.");
  //   }
  // } while (!isValidEmail(email) || AdminUserList.users.any((user) => user.email == email));
  //
  // String password;
  // do {
  //   print("""
  //     Password requirements:
  //     - Have more than 8 characters.
  //     - Contains a capital letter.
  //     - Contains a lowercase letter.
  //     - Contains a number.
  //   """);
  //   stdout.write("Enter your password: ");
  //   password = stdin.readLineSync() ?? "";
  //
  //   if (!isValidPassword(password)) {
  //     print("Invalid password format. Please make sure it meets the requirements.");
  //   }
  // } while (!isValidPassword(password));
  //
  // String name;
  // do {
  //   stdout.write("Enter your name: ");
  //   name = stdin.readLineSync() ?? "";
  //
  //   if (!isValidName(name)) {
  //     print("Invalid name format. First letter of name should be capital letter.");
  //   }
  // } while (!isValidName(name));
  //
  // String surname;
  // do {
  //   stdout.write("Enter your surname: ");
  //   surname = stdin.readLineSync() ?? "";
  //
  //   if (!isValidSurname(surname)) {
  //     print("Invalid surname format. First letter of surname should be capital letter.");
  //   }
  // } while (!isValidSurname(surname));
  //
  // int age;
  // do {
  //   stdout.write("Enter your age: ");
  //   String ageInput = stdin.readLineSync() ?? "";
  //   age = int.tryParse(ageInput) ?? 0;
  //
  //   if (age <= 0) {
  //     print("Invalid age. Please enter a valid age.");
  //   } else if (age < 16) {
  //     print("You are too young. You must be 16 or older.");
  //   }
  // } while (age <= 0 || age < 16);
  //
  // String phoneNumber;
  // do {
  //   stdout.write("Enter your phone number: +998");
  //   phoneNumber = stdin.readLineSync() ?? "";
  //
  //   if (!isValidPhoneNumber(phoneNumber)) {
  //     print("Invalid phone number format. You can enter only 9 digits.");
  //   }
  // } while (!isValidPhoneNumber(phoneNumber));
  //
  // String id = '';
  User user = User("email", "password", "name", "surname", 23, "phoneNumber", /*id*/);


  //print('User JSON: ${user.toJson()}');
  print("Successfully registered!");
  AdminUserList.users.add(user);
  for (var element in AdminUserList.users) {
    print(element.email);
  }
  var res = await NetworkService.postData(user.toJson());
  print(res);

}


bool isValidEmail(String email) {

  RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegExp.hasMatch(email);
}

bool isValidPassword(String password) {
  // Use regular expressions to validate password format
  RegExp hasUpperCase = RegExp(r'[A-Z]');
  RegExp hasLowerCase = RegExp(r'[a-z]');
  RegExp hasDigit = RegExp(r'\d');

  return password.length > 8 &&
      hasUpperCase.hasMatch(password) && hasLowerCase.hasMatch(password) && hasDigit.hasMatch(password);
}

bool isValidName(String name) {

  RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]{2,}$');
  return nameRegExp.hasMatch(name);
}

bool isValidPhoneNumber(String input) {

  return RegExp(r'^\d{9}$').hasMatch(input);
}

bool isValidSurname(String name) {

  RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]{2,}$');
  return nameRegExp.hasMatch(name);
}


  Future<void> checkingPost(User newUser)async {


}

Future<void> checkingGet(User user)async {
  AdminUserList.users.add(user);
  var need  = await NetworkService.getData(NetworkService.apiUser);
  print(need);
  await Navigator.push(AdminSystem());
}

Future<void> checkingDelete(User user)async {
  AdminUserList.users.add(user);
  var need1 = await NetworkService.deleteData("2");
  print(need1);
  await Navigator.push(AdminSystem());
}



