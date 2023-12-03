import 'dart:io';
import 'package:console_shopping_app/Menus/main_menu.dart';

import '../Services/register_admin.dart';


class AdminMenu extends Menu{
  static const id = "/user_menu";

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        RegisterAdmin registerAdmin = RegisterAdmin();
         registerAdmin.signUp();
      }
      break;
      case "2":{
        RegisterAdmin registerAdmin = RegisterAdmin();
        registerAdmin.signIn();
      }
      break;
      case "3":{
        print("Thank you for using our app...");
        exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("1. Sign up");
    print("2. Sign in");
    print("3. Exit");
    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }

}