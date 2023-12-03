import 'dart:io';

import 'package:console_shopping_app/Menus/admin_menu.dart';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Menus/user_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'main_menu.dart';

class HomeMenu extends Menu{
  static const id = "/home_menu";

  Future<void> selectMenu(String press) async {
    switch(press){
      case "1":{
        await Navigator.push(AdminMenu());
      }
      break;
      case "2":{
        await Navigator.push(UserMenu());
      }
      break;
      case "3":{
        await Navigator.push(SettingMenu());
      }
      break;
      case "4": exit(0);
      default: build();
    }
  }

  @override
  Future<void> build()async{
    print("welcome".tr);
    print("1. ${"admin".tr}");
    print("2. ${"user".tr}");
    print("3. ${"setting".tr}");
    print("4. ${"exit".tr}");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}