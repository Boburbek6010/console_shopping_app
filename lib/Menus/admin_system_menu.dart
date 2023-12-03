import 'dart:io';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';

import '../Models/admin.dart';
import '../Services/register_admin.dart';
import 'main_menu.dart';

class AdminSystem extends Menu{
  IOService ioService = IOService();
  static const id = "/product_menu";
  List<Map<String, dynamic>> productList = [];

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        printAllAdminsIndexed();
        build();
      }
      break;
      case "2":{
       addAdmin();
       build();
      }
      break;
      case "3":{

      }
      break;
      case "4":{

      }
      break;
      case "5":{

      }
      break;
      case "6":{

      }
      break;
      case "7":{
        printAllProducts();
      }
      break;
      case "8":{
        stdout.write("index raqamini kiriting ");
        int x = int.tryParse(stdin.readLineSync()!)!;
        deleteProductByIndex(x);
        build();
      }
      break;
      case "9":{
        addProduct();
      }
      break;
      case "10":{
        Navigator.push(SettingMenu());
      }
      break;
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("");
    ioService.pBorder("\x1b[32m\t ---------------------------- \t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 1. Adminlarni ko'rib chiqish \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 2. Adminni o'chirish         \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 3. Adminni qo'shish          \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 4. Userlarni ko'rib chiqish  \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 5. Userni o'chirish          \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 6. Userni qo'shish           \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 7. Haxsulotni ko'rib chiqish \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 8. Maxsulotni o'chirish      \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 9. Mahsulot qo'shish         \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 10. Sozlamalar               \t\t\t\x1b[0m\n".tr);
    IOService.write("\x1b[32m       Tanlang =>              \t\t\t\x1b[0m".tr);

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

  void printAllAdminsIndexed() {
    print("");
    ioService.pBorder("\x1b[32m Registered Admins :              \t\t\t\x1b[0m\n".tr);
    RegisterAdmin.admins.asMap().forEach((index, admin) {
      print("");
      ioService.pBorder("\x1b[32m Admin index ${index + 1} => Email: ${admin.login}, Password: ${admin.password}\x1b[0m\n".tr);
    });
  }

  void addAdmin() {
    String login;
    do {
      stdout.write("Enter your email: ");
      login = stdin.readLineSync() ?? "";

      if (!isValidEmail(login)) {
        print("Invalid email format. Please enter a valid email address.");
      } else if (RegisterAdmin.admins.any((admin) => admin.login == login)) {
        print("Email is already registered. Please use a different email.");
      }
    } while (!isValidEmail(login) || RegisterAdmin.admins.any((admin) => admin.login == login));

    String password;
    do {
      stdout.write("Enter your password: ");
      password = stdin.readLineSync() ?? "";

      if (!isValidPassword(password)) {
        print("Invalid password format. Please make sure it meets the requirements.");
      } else if (RegisterAdmin.admins.any((admin) => admin.password == password)) {
        print("Password is already registered. Please use a different password.");
      }
    } while (!isValidPassword(password) || RegisterAdmin.admins.any((admin) => admin.password == password));

    print("Successfully registered!");
    Admin newAdmin = Admin(login: login, password: password);
    RegisterAdmin.admins.add(newAdmin);
  }

  void addProduct() {
    String name;
    double price;
    int quantity;

    do {
      stdout.write("Enter name: ");
      name = stdin.readLineSync() ?? "";

      if (!isValidText(name)) {
        print("Invalid name format. Please enter a valid name.");
      }
    } while (!isValidText(name));

    do {
      stdout.write("Enter price: ");
      String priceInput = stdin.readLineSync() ?? "";
      price = double.tryParse(priceInput) ?? 0;

      if (price <= 0) {
        print("Invalid price. Please enter a valid price.");
      }
    } while (price <= 0);

    do {
      stdout.write("Enter quantity: ");
      String quantityInput = stdin.readLineSync() ?? "";
      quantity = int.tryParse(quantityInput) ?? 0;

      if (quantity <= 0) {
        print("Invalid quantity. Please enter a valid quantity.");
      }
    } while (quantity <= 0);

    Map<String, dynamic> product = {'name': name, 'price': price, 'quantity': quantity};
    productList.add(product);

  }





  void deleteProductByIndex(int index) {
    if (index >= 0 && index < productList.length) {
      String deletedProductName = productList[index]['name'];
      productList.removeAt(index);
      print("Product at index $index with name '$deletedProductName' deleted successfully.");
    } else {
      print("Invalid index. Please enter a valid index.");
    }
  }


  void printAllProducts() {
    print("Product List:");
    productList.asMap().forEach((index, product) {
      print("Product index ${index + 1} => Name: ${product['name']}, Price: ${product['price']}, Quantity: ${product['quantity']}");
    });
  }

  void printAllProducts1() {
    print("Product List:");
    productList.asMap().forEach((index, product) {
      print("Product index ${index + 1} => Name: ${product['name']}, Price: ${product['price']}, Quantity: ${product['quantity']}");
    });
  }

  bool isValidText(String text) {
    // Matn uzunligi 3 xarfdan katta
    bool isLengthValid = text.length > 2;

    // Matnda raqam bormi
    bool hasDigit = text.contains(RegExp(r'\d'));

    // Matnda belgi (alifbo harfi) bormi
    bool hasLetter = text.contains(RegExp(r'[a-zA-Z]'));

    // Hammasini tekshiramiz va natijani qaytaramiz
    return isLengthValid && !hasDigit && hasLetter;
  }

  /// Checking valid email. A valid mail should meet the following requirements;
  bool isValidEmail(String email) {
    RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  /// Checking valid password. A valid password should meet the following requirements;
  bool isValidPassword(String password) {
    RegExp hasUpperCase = RegExp(r'[A-Z]');
    RegExp hasLowerCase = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');

    return password.length > 8 &&
        hasUpperCase.hasMatch(password) &&
        hasLowerCase.hasMatch(password) &&
        hasDigit.hasMatch(password);
  }

}









