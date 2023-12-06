import 'dart:io';
import 'package:console_shopping_app/Menus/home_menu.dart';
import 'package:console_shopping_app/Menus/product_function.dart';
import 'package:console_shopping_app/Menus/adding_product_with_section.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'package:console_shopping_app/Services/register_admin.dart';
import 'package:console_shopping_app/Services/register_user.dart';
import '../Services/add_api.dart';
import '../Services/admin_user_list.dart';
import 'main_menu.dart';

class AdminSystem extends Menu{
  IOService ioService = IOService();
  ProductFunction productFunction = ProductFunction();
  static const id = "/product_menu";


  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        //printAllAdminsIndexed();
        //apii dan post qilib olish
        AdminUserList.printAllUserIndexed();
        build();
      }
      break;
      case "2":{
        //apii dan udalit qilib tashlash
        AdminUserList.deleteUser();
       build();
      }
      break;
      case "3":{
     await Navigator.push(PostApi());
        build();
      }
      break;
      case "4":{
        ProductFunction.printElementsWithIndexes();
       build();
      }
      break;
      case "5":{
        productFunction.deleteProductByIndex();
        build();
      }
      break;
      case "6":{
        Navigator.push(Departaments());
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
    ioService.pBorder("\x1b[32m 1. ${IOService.txtBlock("Userlarni_korib_chiqish".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 2. ${IOService.txtBlock("delete_user".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 3. ${IOService.txtBlock("add_user".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 4. ${IOService.txtBlock("product_review".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 5. ${IOService.txtBlock("delete_product".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 6. ${IOService.txtBlock("add_product".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 7. ${IOService.txtBlock("Menu".tr)}\x1b[0m");
    print(" ");
    IOService.write("\x1b[32m  ${"choose =>".tr} \t\x1b[0m".tr);

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}









