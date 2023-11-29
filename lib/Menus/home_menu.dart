import 'main_menu.dart';
import 'dart:io';
class HomeMenu extends Menu{

  String? press;
  void select(){
  press = stdin.readLineSync() ?? "";

  }


  @override
  Future<void> build() async {
    print("home menu");
  }

}







