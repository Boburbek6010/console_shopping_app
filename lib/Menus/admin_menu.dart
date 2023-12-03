import 'dart:io';
import 'package:console_shopping_app/Menus/main_menu.dart';
import 'package:console_shopping_app/Services/register_admin.dart';
// import 'package:console_shopping_app/Menus/user_menu.dart';
// import 'package:console_shopping_app/Services/navigation_service.dart';
// import 'package:console_shopping_app/Services/register_user.dart';

class AdminMenu extends Menu{
  static const id = "/user_menu";

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
         RegisterAdmin registerAdmin = RegisterAdmin();
         registerAdmin.signUp();
      }
      break;
      case "2":{
         RegisterAdmin registerAdminn = RegisterAdmin();
         registerAdminn.signIn();
      }
      break;
      case "3":{
        print("\t\t Thank you for using our app...");
        exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("\t\t 1. Sign up");
    print("\t\t 2. Sign in");
    print("\t\t 3. Exit");
    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }

}