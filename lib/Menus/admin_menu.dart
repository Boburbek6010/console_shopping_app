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

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        RegisterAdmin registerAdmin = RegisterAdmin();
         registerAdmin.signIn();
      }
      break;
      case "2":{
        Navigator.push(HomeMenu());
      }
      break;
      default: {
        build();
      }
    }
  }


  @override
  Future<void> build()async{
    ioService.pBorder("\x1b[32m 1. ${IOService.txtBlock("Enter")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 2. ${IOService.txtBlock("Menu")}\x1b[0m".tr);

    String press ="";
do{
  IOService.write("\x1b[32m  Tanlang =>  \t\x1b[0m".tr);
  press = stdin.readLineSync()!;
  if(press != "1" && press != "2"){
    print("\n");
    ioService.pBorder("\x1b[31m \t\t\t${IOService.txtBlock(" Xato kiritdingiz ")}\x1b[0m".tr);
  } else {
   break;
  }
}while(true);
    await selectMenu(press);
  }

}