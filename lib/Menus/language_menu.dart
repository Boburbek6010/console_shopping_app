import 'dart:io';
import '../Services/language_service.dart';
import 'main_menu.dart';

class LanguageMenu extends Menu{
  static const id = "/language_menu";

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        LanguageService.setLanguage = Language.uz;
      }
      break;
      case "2":{
        LanguageService.setLanguage = Language.ru;
      }
      break;
      case "3":{
        LanguageService.setLanguage = Language.en;
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("1. UZ");
    print("2. RU");
    print("3. EN");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}