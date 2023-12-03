import 'dart:io';
import 'package:console_shopping_app/Menus/main_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import '../Services/io_service.dart';
import '../Services/register_admin.dart';


class AdminMenu extends Menu{
  static const id = "/user_menu";
  IOService ioService = IOService();

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
        ioService.pBlue("sdf");
        ioService.pBorder("\x1b[32m \t Bizning app imizdan foydalanganingiz uchun raxmat  \t\t\t\x1b[0m".tr);
        exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    ioService.pBorder("\x1b[32m \t\t\t 1. Sign up         \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m \t\t\t 2. Sign in         \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m \t\t\t 3. Exit         \t\t\t\x1b[0m".tr);

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }

}