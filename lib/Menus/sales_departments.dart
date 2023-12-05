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
    ioService.pBorder("\x1b[32m 1. ${IOService.txtBlock("Bolalar uchun")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 2. ${IOService.txtBlock("Kochmas Mulk")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 3. ${IOService.txtBlock("Transport")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 4. ${IOService.txtBlock("Uy hayvonlari")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 5. ${IOService.txtBlock("Uy va bog' uchun mahsulotlar")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 6. ${IOService.txtBlock("Elektr jihozlari")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 7. ${IOService.txtBlock("Moda va Still")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 8. ${IOService.txtBlock("Xobbi, dam olish va Sport")}\x1b[0m".tr);
    ioService.pBorder("\x1b[31m \t\t\t 9. Exit   \x1b[0m".tr);
    print(" ");
    String press ="";
    do{
      IOService.write("\x1b[32m  Tanlang =>  \t\x1b[0m".tr);
      press = stdin.readLineSync()!;
      if(press != "1" && press != "2"){
        print("\n");
        ioService.pBorder("\x1b[31m \t\t\t${IOService.txtBlock("Xato kiritdingiz")}\x1b[0m".tr);
      } else {
        break;
      }
    }while(true);
    await selectMenu(press);
  }




}

