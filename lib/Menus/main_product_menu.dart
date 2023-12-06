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

  //List<List<Map<String,dynamic>productList> departaments = [];
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
      "color": "qizil",
      "name": "Muzlatgich",
      "price": 500,
      "quantity": 50,
      "id": "AX6"
    }];
  static Map<String, dynamic> product = {'type' : type,"color": color, 'name': name, 'price': price, 'quantity': quantity};
  static List<List<Map<String, dynamic>>> alltypes = [defaultproductList,productListBolalarUchun,productListHobbiVaDamOlish, productListModaVaStil,productListUyBog, productListElectrJihozlar,productListUyHayvonlari, productListTransport, productListKochmasMulk,productListBolalarUchun];




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
       await Navigator.push(HomeMenu());
      }
      break;
      case "4":{
        exit(0);
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
    // print("3. ${"Borrow product".tr}");
    // print("4. ${"return product".tr}");
    print("3. ${"Menu".tr}");
    print("4. ${"Exit".tr}");
    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }




}