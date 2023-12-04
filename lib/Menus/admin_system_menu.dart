import 'dart:io';
import 'package:console_shopping_app/Menus/home_menu.dart';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';

import '../Models/admin.dart';
import '../Services/admin_user_list.dart';
import '../Services/register_admin.dart';
import 'buy_product_menu.dart';
import 'main_menu.dart';
import 'main_product_menu.dart';

class AdminSystem extends Menu{
  IOService ioService = IOService();
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
        printAllProducts();
       build();
      }
      break;
      case "5":{
        deleteProductByIndex();
        build();
      }
      break;
      case "6":{
        addProduct();
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









