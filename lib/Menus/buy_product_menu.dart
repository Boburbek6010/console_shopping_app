import 'dart:io';
import 'package:console_shopping_app/Menus/product_function.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'main_menu.dart';


class BuyProductMenu extends Menu{
  static const id = "/product_menu";
  IOService ioService =IOService();


  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        ProductFunction productFunction = ProductFunction();
        productFunction.printAllProducts();
        build();
      }
      break;
      case "2":{
        // bu yerga Product menuga bitta select menusini yozib chaqirib ishlatsam boldi
      }
      break;
      case "3":{
       // await Navigator.push(HomeMenu());
      }
      break;
      default: build();
    }
  }


  @override
  Future<void> build()async{
    ioService.pBorder("\x1b[32m    ${IOService.txtBlock("--------------------------")}\x1b[0m");
    ioService.pBorder("\x1b[32m 1. ${IOService.txtBlock("All Product".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 2. ${IOService.txtBlock("Basket".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 3. ${IOService.txtBlock("Setting".tr)}\x1b[0m");
    print(" ");
    IOService.write("\x1b[32m  Tanlang =>  \t\x1b[0m".tr);
    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);




  }

}