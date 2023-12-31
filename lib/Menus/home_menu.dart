import 'dart:io';

import 'package:console_shopping_app/Menus/admin_menu.dart';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import '../Services/register_user.dart';
import 'main_menu.dart';

class HomeMenu extends Menu{
  static const id = "/home_menu";
  IOService ioService =IOService();

  Future<void> selectMenu(String press) async {
    switch(press){
      case "1":{
        await Navigator.push(AdminMenu());
      }
      break;
      case "2":{
        await Navigator.push(RegisterUser());
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

    // print("\t\t\t ${""}".tr);
    ioService.pBorder("\x1b[32m \t 1. ${"Administrator".tr}   \t\t\t\x1b[0m");
    ioService.pBorder("\x1b[32m \t 2. ${"user".tr}            \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m \t 3. ${"setting".tr}         \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[31m \t 4. ${"Exit".tr}            \t\t\t\x1b[0m".tr);


    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}