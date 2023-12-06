import 'dart:io';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'main_product_menu.dart';

class ProductFunction{

 static void printElementsWithIndexes() {
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
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m ${"enter_type:".tr} \x1b[0m\n");
      ProductMenu.type = stdin.readLineSync() ?? "";
      if (!isValidText(ProductMenu.type)) {
        ioService.pBorder("\x1b[31m ${"invalid_t_f.P_e_a_v_n.".tr} \t\t\t\x1b[0m\n");
      }
    } while (!isValidText(ProductMenu.type));

    do {
      //stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m ${"enter_name:".tr} \x1b[0m\n");
      ProductMenu.name = stdin.readLineSync() ?? "";
      if (!isValidText(ProductMenu.name)) {
        ioService.pBorder("\x1b[31m ${"invalid_t_f.P_e_a_v_n.".tr} \t\t\t\x1b[0m\n");
      }
    } while (!isValidText(ProductMenu.name));

    do {
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m ${"enter_color:".tr} \x1b[0m\n".tr);
      ProductMenu.color = stdin.readLineSync() ?? "";
      if (!isValidText(ProductMenu.color)) {
        ioService.pBorder("\x1b[31m ${"invalid_t_f.P_e_a_v_n.".tr} \t\t\t\x1b[0m\n".tr);
      }
    } while (!isValidText(ProductMenu.color));

    do {
      ioService.pBorderstdout("\x1b[32m ${"enter_quantity:".tr}  \x1b[0m\n".tr);
      String quantityInput = stdin.readLineSync() ?? "";
      ProductMenu.quantity = int.tryParse(quantityInput) ?? 0;
      if (ProductMenu.quantity <= 0) {
        ioService.pBorder("\x1b[31m ${"invalid_t_f.P_e_a_v_n.".tr} \t\x1b[0m\n".tr);
      }
    } while (ProductMenu.quantity <= 0);

    do {
      stdout.write(" ${"Enter price:".tr} ");
      String priceInput = stdin.readLineSync() ?? "";
      ProductMenu.price = double.tryParse(priceInput) ?? 0;
      if (ProductMenu.price <= 0) {
        ioService.pBorder("\x1b[31m ${"invalid_t_f.P_e_a_v_n.".tr}.\t\t\t\x1b[0m\n".tr);
      }
    } while (ProductMenu.price <= 0);

    ProductMenu.defaultproductList.add(ProductMenu.product);
    ioService.pBorder("\x1b[32m ${"successfully_added!".tr} \t\t\t\x1b[0m\n".tr);
  }

  void deleteProductByIndex() {
    print("enter_the_index_number".tr);
    int index = int.tryParse(stdin.readLineSync()!)!;
    if (index >= 0 && index < ProductMenu.defaultproductList.length) {
      String deletedProductName = ProductMenu.defaultproductList[index]['name'];
      ProductMenu.defaultproductList.removeAt(index);
      print("$index  ${"with_name".tr} '$deletedProductName' ${"deleted_successfully".tr}");
    } else {
      print("i_i.p_e_a_v_i.".tr);
    }
  }

  bool isValidText(String text) {
    bool isLengthValid = text.length > 2;
    bool hasDigit = text.contains(RegExp(r'\d'));
    bool hasLetter = text.contains(RegExp(r'[a-zA-Z]'));
    return isLengthValid && !hasDigit && hasLetter;
  }

  }

