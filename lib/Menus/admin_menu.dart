import 'dart:io';
import 'package:console_shopping_app/Menus/home_menu.dart';
import 'package:console_shopping_app/Menus/main_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import '../Services/io_service.dart';
import '../Services/register_admin.dart';


class AdminMenu extends Menu{
  static const id = "/user_menu";
  IOService ioService = IOService();
  /*
  faqat enter , Menu, Exit ==> bolimlari bolishi kerak Admin uchun default qiymatdan foydalanish kerak
   */


  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        RegisterAdmin registerAdmin = RegisterAdmin();
         registerAdmin.signUp();
      }
      break;
      case "2":{
        Navigator.push(HomeMenu());
      }
      break;
      case "3":{
        ioService.pBorder("\x1b[32m \t Bizning app imizdan foydalanganingiz uchun raxmat  \t\t\t\x1b[0m".tr);
        exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    ioService.pBorder("\x1b[32m \t\t\t 1. Enter         \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m \t\t\t 2. Menu         \t\t\t\x1b[0m".tr);
    print(" ");
    ioService.pBorder("\x1b[31m \t\t\t 3. Exit   \x1b[0m".tr);

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }

}