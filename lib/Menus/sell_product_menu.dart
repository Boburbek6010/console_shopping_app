import 'dart:io';
import 'package:console_shopping_app/Menus/sales_departments.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'home_menu.dart';
import 'main_menu.dart';


class SellProductMenu extends Menu{
  static const id = "/product_menu";
  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        await Navigator.push(Departaments());
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
    print("---------------------------------");//bu yerda bolishi kere boledigan narsala1
    print("1. ${"Select section".tr}");
    print("2. ${"Menu".tr}");
    print("3. ${"Exit".tr}");


    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}