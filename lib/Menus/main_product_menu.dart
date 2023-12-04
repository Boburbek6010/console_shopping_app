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
  static List<Map<String, dynamic>> productList = [{
    "type": "Avtomobil",
    "color": "Qora",
    "name": "Gentra",
    "price": 18000,
    "quantity": 1,
    "id": "AX1"
  },
    {
      "Electronika": "type 2",
      "color": "color 2",
      "name": "name 2",
      "price": 22,
      "quantity": 71,
      "id": "AX2"
    },
    {
      "type": "type 3",
      "color": "color 3",
      "name": "name 3",
      "price": 24,
      "quantity": 51,
      "id": "AX3"
    },
    {
      "type": "type 4",
      "color": "color 4",
      "name": "name 4",
      "price": 83,
      "quantity": 63,
      "id": "AX4"
    },
    {
      "type": "type 5",
      "color": "color 5",
      "name": "name 5",
      "price": 51,
      "quantity": 35,
      "id": "AX5"
    },
    {
      "type": "type 6",
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
    print("2. ${"Basket".tr}");
    // basketda bolishi kere listlar va id select uchun idni kiritsa yangi listga backetga tushgan elemtlarni toplaydigan qilish kerak
    print("3. ${"Setting".tr}");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }


  void addProduct() {
    do {
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m Enter name : \x1b[0m\n".tr);
      ProductMenu.name = stdin.readLineSync() ?? "";
      if (!isValidText(ProductMenu.name)) {
        ioService.pBorder("\x1b[31m Invalid name format. Please enter a valid name. \t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidText(ProductMenu.name));

    do {
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m Enter type : \x1b[0m\n".tr);
      ProductMenu.type = stdin.readLineSync() ?? "";
      if (!isValidText(ProductMenu.type)) {
        ioService.pBorder("\x1b[31m Invalid type format. Please enter a valid name. \t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidText(ProductMenu.type));

    do {
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m Enter color : \x1b[0m\n".tr);
      ProductMenu.color = stdin.readLineSync() ?? "";
      if (!isValidText(ProductMenu.color)) {
        ioService.pBorder("\x1b[31m Invalid color format. Please enter a valid name. \t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidText(ProductMenu.color));

    do {
      stdout.write("Enter price: ");
      String priceInput = stdin.readLineSync() ?? "";
      ProductMenu.price = double.tryParse(priceInput) ?? 0;
      if (ProductMenu.price <= 0) {
        ioService.pBorder("\x1b[31m Invalid price. Please enter a valid price.\t\t\t\x1b[0m\n".tr);
      }
    } while (ProductMenu.price <= 0);

    do {
      ioService.pBorderstdout("\x1b[32m Enter quantity:  \x1b[0m\n".tr);
      String quantityInput = stdin.readLineSync() ?? "";
      ProductMenu.quantity = int.tryParse(quantityInput) ?? 0;
      if (ProductMenu.quantity <= 0) {
        ioService.pBorder("\x1b[31m Invalid quantity. Please enter a valid quantity. \t\x1b[0m\n".tr);
      }
    } while (ProductMenu.quantity <= 0);

    ProductMenu.productList.add(ProductMenu.product);
    ioService.pBorder("\x1b[32m Successfully added! \t\t\t\x1b[0m\n".tr);
  }

  void printAllProducts() {
    print("Product List:");
    ProductMenu.productList.asMap().forEach((index, product) {
      print("Product index ${index + 1} => Name: ${product['name']}, Price: ${product['price']}, Quantity: ${product['quantity']}");
    });
  }

  void deleteProductByIndex() {
    print("index raqamini kiriting ");
    int index = int.tryParse(stdin.readLineSync()!)!;
    if (index >= 0 && index < ProductMenu.productList.length) {
      String deletedProductName = ProductMenu.productList[index]['name'];
      ProductMenu.productList.removeAt(index);
      print("Product at index $index with name '$deletedProductName' deleted successfully.");
    } else {
      print("Invalid index. Please enter a valid index.");
    }
  }

  bool isValidText(String text) {
    bool isLengthValid = text.length > 2;

    bool hasDigit = text.contains(RegExp(r'\d'));

    bool hasLetter = text.contains(RegExp(r'[a-zA-Z]'));

    return isLengthValid && !hasDigit && hasLetter;
  }

}