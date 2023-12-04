import 'dart:io';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';

import '../Services/register_user.dart';
import 'main_menu.dart';


class UserMenu extends Menu{
  static const id = "/user_menu";

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        RegisterUser registerUser = RegisterUser();
        registerUser.signUp();
      }
      break;
      case "2":{
        RegisterUser registerUser = RegisterUser();
        registerUser.signIn();
      }
      break;
      case "3":{
       await Navigator.push(SettingMenu());
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("1. ${"sign_up".tr}");
    print("2. ${"sign_in".tr}");
    print("3. ${"setting".tr}");
    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }

}