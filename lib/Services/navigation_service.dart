import 'package:console_shopping_app/Menus/main_menu.dart';

class Navigator{
  // static final List<Menu> _menus = [];
  static Menu? initialMenu;

  static Future push(Menu menu) async {
    initialMenu = menu;
    await initialMenu?.build();
  }

}