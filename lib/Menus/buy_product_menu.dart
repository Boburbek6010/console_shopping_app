import 'dart:io';
import 'package:console_shopping_app/Menus/sell_product_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'home_menu.dart';
import 'language_menu.dart';
import 'main_menu.dart';


class BuyProductMenu extends Menu{
  static const id = "/product_menu";


  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
       // await Navigator.push(HomeMenu());
      }
      break;
      case "2":{
        //await Navigator.push(HomeMenu());
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
    print("---------------------------------");
    print("1. ${"Announcements".tr}");
    print("2. ${"Basket".tr}");
    print("3. ${"Setting".tr}");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}