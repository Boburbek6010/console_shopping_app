import 'dart:io';
import 'package:console_shopping_app/Menus/home_menu.dart';
import 'package:console_shopping_app/Menus/setting_menu.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/language_service.dart';
import 'package:console_shopping_app/my_app.dart';



Future<void> main() async {
  IOService ioService = IOService();
  {
    ioService.pBorder("\x1b[32m \t\t\t   Xush kelibsiz     \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m \t\t\t Добро пожаловать    \t\t\t\x1b[0m".tr);
    ioService.pBorder("\x1b[32m \t\t\t    Welcome          \t\t\t\x1b[0m".tr);
      print(" ");
    IOService.write("\x1b[34m    1. UZ  \t\x1b[0m");
    IOService.write("\x1b[33m    2. РУ  \t\x1b[0m");
    IOService.write("\x1b[36m    3. EN  \t\x1b[0m");
    print("\n");
    IOService.write1("\x1b[32m  Choose =>  \t\x1b[0m".tr);

    MyApp(
      home: HomeMenu(),
      routes: {
        HomeMenu.id:HomeMenu(),
        SettingMenu.id:SettingMenu()
      },
    );


  }



}