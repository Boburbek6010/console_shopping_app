import 'dart:io';
import 'package:console_shopping_app/Menus/sell_product_menu.dart';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'buy_product_menu.dart';
import 'home_menu.dart';
import 'main_menu.dart';


class ProductMenu extends Menu{
  static const id = "/product_menu";
 static String type ='';
 static String name = '';
 static String color='';
 static double price = 0;
 static int quantity = 0;
  static List<Map<String, dynamic>> productList = [];
  static Map<String, dynamic> product = {'type' : type,"color": color, 'name': name, 'price': price, 'quantity': quantity};

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        await Navigator.push(SellProductMenu());
      }
      break;
      case "2":{
        await Navigator.push(BuyProductMenu());
      }
      break;
      case "3":{
        await Navigator.push(SettingMenu());
      }
      break;
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("---------------------------------");
    print("1. ${"Sell products".tr}");
    print("2. ${"Buy products".tr}");
    print("3. ${"Setting".tr}");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}