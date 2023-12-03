import 'dart:io';
import '../Services/register_user.dart';
import 'main_menu.dart';


class UserMenu extends Menu{
  static const id = "/user_menu";

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        RegisterUser registerUser = RegisterUser();
        registerUser.signUp();
      }
      break;
      case "2":{
        RegisterUser registerUser = RegisterUser();
        registerUser.signIn();
      }
      break;
      case "3":{
        print("Thank you for using our app...");
        exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("1. Sign up");
    print("2. Sign in");
    print("3. Exit");
    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }

}