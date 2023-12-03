import 'dart:io';
import 'package:console_shopping_app/Menus/home_menu.dart';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/language_service.dart';
import 'package:console_shopping_app/my_app.dart';



Future<void> main() async {

  {

    print("\t\t\t ${"  Xush kelibsiz"}".tr);
    print("\t\t\t ${"Добро пожаловать"}".tr);
    print("\t\t\t ${"    Welcome"}".tr);

    print("\t\t 1. UZ");
    print("\t\t 2. RU");
    print("\t\t 3. EN");

    String lang = stdin.readLineSync()!;

    LanguageService.switchLanguage(lang);

    MyApp(
      home: HomeMenu(),
      lang: Language.uz,
      routes: {
        HomeMenu.id:HomeMenu(),

        SettingMenu.id:SettingMenu()
      },
    );


  }



}