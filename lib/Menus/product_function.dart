import 'dart:io';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'main_product_menu.dart';

class ProductFunction{

  void printElementsWithIndexes() {
    for (int i = 0; i < ProductMenu.alltypes.length; i++) {
      List<Map<String, dynamic>> currentList = ProductMenu.alltypes[i];
      for (int j = 0; j < currentList.length; j++) {
        Map<String, dynamic> currentMap = currentList[j];
        print('\t $j: $currentMap');
      }
    }
  }




  void addProduct() {
    IOService ioService = IOService();
    do {
      //stdout.write(" ");
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

    ProductMenu.defaultproductList.add(ProductMenu.product);
    ioService.pBorder("\x1b[32m Successfully added! \t\t\t\x1b[0m\n".tr);
  }

  /*void printAllProducts() {
    print("Product List:");
    ProductMenu.defaultproductList.asMap().forEach((index, product) {
      IOService ioService = IOService();
      ioService.pBorder("\x1b[32m ${index + 1} => Name: ${product['name']}, Price: ${product['price']}, Quantity: ${product['quantity']}  \x1b[0m\n".tr);
    });
  }*/

  void deleteProductByIndex() {
    print("Index raqamini kiriting ");
    int index = int.tryParse(stdin.readLineSync()!)!;
    if (index >= 0 && index < ProductMenu.defaultproductList.length) {
      String deletedProductName = ProductMenu.defaultproductList[index]['name'];
      ProductMenu.defaultproductList.removeAt(index);
      print("$index with name '$deletedProductName' deleted successfully.");
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

