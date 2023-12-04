import 'dart:io';

import 'package:console_shopping_app/Services/extention_service.dart';

import '../Services/navigation_service.dart';
import 'home_menu.dart';
import 'language_menu.dart';
import 'main_menu.dart';


class SettingMenu extends Menu{
  static const id = "/settings_menu";

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        await Navigator.push(LanguageMenu());
      }
      break;
      case "2":{
        await Navigator.push(HomeMenu());
      }
      break;
      case "3":{
        exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("1. ${"Change_lang".tr}");
    print("2. ${"Home_menu".tr}");
    print("3. ${"Exit".tr}");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}