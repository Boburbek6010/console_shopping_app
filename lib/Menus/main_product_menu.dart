import 'dart:io';
import 'package:console_shopping_app/Menus/sell_product_menu.dart';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'buy_product_menu.dart';
import 'home_menu.dart';
import 'main_menu.dart';


class ProductMenu extends Menu{
  static const id = "/product_menu";
  IOService ioService = IOService();
  static String type ='';
  static String name = '';
  static String color='';
  static double price = 0;
  static int quantity = 0;

  // bu yerga List<List<Map<String,dynamic>productList> departaments = [];
  //shunga oid funksiyalar sales departamentda yoziladi list ichiga mashina saqlaydigan list oladi, uyjoy elon saqlaydigan list oladi va hokozo

  //productListBolalarUchun.add(product);
  static List<Map<String, dynamic>> productListBolalarUchun = [];
  static List<Map<String, dynamic>> productListKochmasMulk = [];
  static List<Map<String, dynamic>> productListTransport = [];
  static List<Map<String, dynamic>> productListUyHayvonlari = [];
  static List<Map<String, dynamic>> productListUyBog = [];
  static List<Map<String, dynamic>> productListElectrJihozlar = [];
  static List<Map<String, dynamic>> productListModaVaStil = [];
  static List<Map<String, dynamic>> productListHobbiVaDamOlish = [];

  static List<Map<String, dynamic>> defaultproductList = [{
    "type": "Avtomobil",
    "color": "Qora",
    "name": "Gentra",
    "price": 18000,
    "quantity": 1,
    "id": "AX1"
  },
    {
      "type": "TV",
      "color": "Qora",
      "name": "Shivaki",
      "price": 180,
      "quantity": 7,
      "id": "AX2"
    },
    {
      "type": "Telefon",
      "color": "Hamelion",
      "name": "RedMi Not 11 pro",
      "price": 245,
      "quantity": 10,
      "id": "AX3"
    },
    {
      "type": "Santexnika",
      "color": "oq",
      "name": "Oshxona krani",
      "price": 8,
      "quantity": 100,
      "id": "AX4"
    },
    {
      "type": "Kompyuter",
      "color": "Kulrang",
      "name": "MacBook pro M2",
      "price": 1500,
      "quantity": 30,
      "id": "AX5"
    },
    {
      "type": "Oshxona jihozi",
      "color": "color 6",
      "name": "name 6",
      "price": 29,
      "quantity": 45,
      "id": "AX6"
    },
    {
      "type": "type 7",
      "color": "color 7",
      "name": "name 7",
      "price": 12,
      "quantity": 27,
      "id": "AX7"
    },
    {
      "type": "type 8",
      "color": "color 8",
      "name": "name 8",
      "price": 58,
      "quantity": 7,
      "id": "AX8"
    },
    {
      "type": "type 9",
      "color": "color 9",
      "name": "name 9",
      "price": 18,
      "quantity": 41,
      "id": "AX9"
    },
    {
      "type": "type 10",
      "color": "color 10",
      "name": "name 10",
      "price": 2,
      "quantity": 99,
      "id": "AX10"
    }];
  static Map<String, dynamic> product = {'type' : type,"color": color, 'name': name, 'price': price, 'quantity': quantity};
  static List<List<Map<String, dynamic>>> alltypes = [defaultproductList,productListBolalarUchun,defaultproductList,productListHobbiVaDamOlish, productListModaVaStil,productListUyBog, productListElectrJihozlar,productListUyHayvonlari, productListTransport, productListKochmasMulk,productListBolalarUchun];




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
       // await Navigator.push(SettingMenu());
      }
      break;
      case "4":{
        //await Navigator.push(SettingMenu());
      }
      break;
      case "5":{
        //await Navigator.push(SettingMenu());
      }
      break;
      case "6":{
        //await Navigator.push(SettingMenu());
      }
      break;
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("---------------------------------");
    print("1. ${"Sell products".tr}");
    print("2. ${"Buy products".tr}"); /// alltypes listdagi elementdan sotib olish logikasini qilish kerak
    print("3. ${"Borrow product".tr}");
    print("4. ${"return product".tr}");
    print("5. ${"Menu".tr}");
    print("6. ${"Exit".tr}");
    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }




}