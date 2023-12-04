import 'dart:io';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'home_menu.dart';
import 'language_menu.dart';
import 'main_menu.dart';


class Departaments extends Menu{
  static const id = "/product_menu";
  IOService ioService = IOService();

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        //await Navigator.push(HomeMenu());
      }
      break;
      case "2":{
        // await Navigator.push(HomeMenu());
      }
      break;
      case "3":{
        // await Navigator.push(HomeMenu());
      }
      break;
      case "4":{
        await Navigator.push(SettingMenu());
      }
      break;
      default: build();
    }
  }


  @override
  Future<void> build()async{
    ioService.pBorder("\x1b[32m \t\t\t 1. Trnasport         \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m \t\t\t 2. Ko'chmas Mulk         \t\t\t\x1b[0m".tr);
    print(" ");
    ioService.pBorder("\x1b[31m \t\t\t 3. Exit   \x1b[0m".tr);

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}