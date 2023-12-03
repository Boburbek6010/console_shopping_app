import 'dart:io';
import 'package:console_shopping_app/Menus/main_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
// import 'package:console_shopping_app/Menus/user_menu.dart';
// import 'package:console_shopping_app/Services/navigation_service.dart';
// import 'package:console_shopping_app/Services/register_user.dart';

class AdminMenu extends Menu{
  static const id = "/user_menu";

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        // RegisterUser registerUser = RegisterUser();
        // registerUser.signUp();
      }
      break;
      case "2":{
        // RegisterUser registerUser = RegisterUser();
        // registerUser.signIn();
      }
      break;
      case "3":{
        print("exit_text".tr);
        exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("sign_up".tr);
    print("sign_in".tr);
    print("exit".tr);
    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }

}