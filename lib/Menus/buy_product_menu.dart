import 'dart:io';
import 'package:console_shopping_app/Menus/product_function.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'main_menu.dart';
import 'main_product_menu.dart';


class BuyProductMenu extends Menu{
  static const id = "/product_menu";
  IOService ioService =IOService();


  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        //printElementsWithIndexes();
        ProductFunction.printElementsWithIndexes();
        build();
      }
      break;
      case "2":{
        basket();
        build();
      }
      break;
      case "3":{
       Navigator.push(ProductMenu());
      }
      break;
      case "4":{
        exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    ioService.pBorder("\x1b[32m    ${IOService.txtBlock("--------------------------")}\x1b[0m");
    ioService.pBorder("\x1b[32m 1. ${IOService.txtBlock("all_product".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 2. ${IOService.txtBlock("basket".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 3. ${IOService.txtBlock("Menu".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 4. ${IOService.txtBlock("Exit".tr)}\x1b[0m");
    print(" ");
    IOService.write("\x1b[32m  ${"choose =>".tr}  \t\x1b[0m".tr);
    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }

  void printElementsWithIndexes() {
    for (int i = 0; i < ProductMenu.alltypes.length; i++) {
      List<Map<String, dynamic>> currentList = ProductMenu.alltypes[i];
      for (int j = 0; j < currentList.length; j++) {
        Map<String, dynamic> currentMap = currentList[j];
        print('\t $j: $currentMap \n');
      }
    }
  }

  void basket(){
    List shoppingBasket = [];

    do {
      print("available_products:".tr);
      ProductFunction.printElementsWithIndexes();

      stdout.write("enter_the_index_of_the_selected_product_(or_type_'ok'): ".tr);
      String userInput = stdin.readLineSync() ?? "";

      if (userInput.toLowerCase() == 'ok') {
        print("products_in_the_basket:".tr);
        for (int i = 0; i < shoppingBasket.length; i++) {
          print(" $i: ${shoppingBasket[i]}");
        }
        break;
      }

      int selectedProductIndex = int.tryParse(userInput) ?? -1;

      if (selectedProductIndex >= 0 && selectedProductIndex < ProductMenu.alltypes.length) {
        var selectedProduct = ProductMenu.alltypes[selectedProductIndex];
        shoppingBasket.add(selectedProduct);
        print("$selectedProduct ${"added_to_basket".tr}");
        ProductMenu.alltypes.removeAt(selectedProductIndex);
      } else {
        print("W_ch.P_t_a.".tr);
      }
    } while (true);
  }

}