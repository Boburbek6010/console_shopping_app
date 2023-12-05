import 'dart:io';
import 'package:console_shopping_app/Menus/home_menu.dart';
import 'package:console_shopping_app/Menus/product_function.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import '../Services/admin_user_list.dart';
import 'main_menu.dart';

class AdminSystem extends Menu{
  IOService ioService = IOService();
  ProductFunction productFunction = ProductFunction();
  static const id = "/product_menu";


  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        //printAllAdminsIndexed();
        AdminUserList.printAllUserIndexed();
        build();
      }
      break;
      case "2":{
        AdminUserList.deleteUser();
       build();
      }
      break;
      case "3":{
        AdminUserList.addUser();
        build();
      }
      break;
      case "4":{
        productFunction.printAllProducts();
       build();
      }
      break;
      case "5":{
        productFunction.deleteProductByIndex();
        build();
      }
      break;
      case "6":{
        productFunction.addProduct();
        build();
      }
      break;
      case "7":{
        Navigator.push(HomeMenu());
        // build();
      }
      break;
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print(" ");
    ioService.pBorder("\x1b[32m    ${IOService.txtBlock("--------------------------")}\x1b[0m");
    ioService.pBorder("\x1b[32m 1. ${IOService.txtBlock("Userlarni_korib_chiqish".tr)}\x1b[0m");   // language ishladi faqat shu qator uchun
    ioService.pBorder("\x1b[32m 2. ${IOService.txtBlock("Userni o'chirish".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 3. ${IOService.txtBlock("Userni qo'shish".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 4. ${IOService.txtBlock("Maxsulotni ko'rib chiqish".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 5. ${IOService.txtBlock("Maxsulotni o'chirish".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 6. ${IOService.txtBlock("Mahsulot qo'shish".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 7. ${IOService.txtBlock("Menu".tr)}\x1b[0m");
    print(" ");
    IOService.write("\x1b[32m  Tanlang =>  \t\x1b[0m".tr);

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}









